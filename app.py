from flask import Flask, render_template, request, redirect, jsonify
import psycopg2

app = Flask(__name__)

# Database connection
def get_db_connection():
    connection = psycopg2.connect(
        dbname='postgres',
        user='postgres',
        password='password',
        host='db',  # Service name in docker-compose.yml
        port='5432'
    )
    return connection

def format_pg_error(err):
    return {
        "error": str(err),
        "pgcode": err.pgcode,
        "pgerror": err.pgerror,
        "details": err.diag.message_detail,
        "hint": err.diag.message_hint
    }

@app.route('/execute-query', methods=['POST'])
def execute_query():
    if not request.is_json:
        return jsonify({"error": "Invalid Request"}), 400
    
    query = request.json.get('query')    
    if not query:
        return jsonify({"error": "Invalid Query"}), 400

    db_connection = get_db_connection()
    db_cursor = db_connection.cursor()
    try:
        db_cursor.execute(query)
        if db_cursor.description:  # This checks if the query returned rows (i.e., SELECT)
            rows = db_cursor.fetchall()
            columns = [desc[0] for desc in db_cursor.description]
            results = [dict(zip(columns, row)) for row in rows]
            db_cursor.close()
            db_connection.close()
            result_string = '+'.join('+'.join(f"{key}:{value}" for key, value in result.items()) for result in results)
            return jsonify({"message": result_string}), 200
        else:
            db_connection.commit()
            db_cursor.close()
            db_connection.close()
            return jsonify({"message": "Query executed successfully"}), 201
        
    except psycopg2.Error as e:
        error_details = format_pg_error(e)
        db_cursor.close()
        db_connection.close()
        return jsonify({"message": error_details['error']}), 201

    except Exception as e:
        error_details = {
            "error": str(e),
            "pgcode": getattr(e, 'pgcode', None),
            "pgerror": getattr(e, 'pgerror', None),
            "details": getattr(e, 'diag', {}).get('message_detail', None),
            "hint": getattr(e, 'diag', {}).get('message_hint', None)
        }
        db_cursor.close()
        db_connection.close()
        return jsonify({"message":  error_details['error']}), 201

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/student-homepage')
def student_homepage():
    return render_template('student-homepage.html')

@app.route('/lab-material-one')
def lab_material_one():
    return render_template('lab-material-one.html')

@app.route('/lab-material-two')
def lab_material_two():
    return render_template('lab-material-two.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)