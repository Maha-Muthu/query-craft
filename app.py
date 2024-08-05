from flask import Flask, render_template, request, jsonify, json
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
        results = {"ResponseSource": ["Before Execution"], "Message":["Invalid Request"]}
        message_results = json.dumps(results)
        return jsonify({"message": message_results}), 400
    
    query = request.json.get('query')    
    if not query:
        results = {"ResponseSource": ["Before Execution"], "Message":["Invalid Query"]}
        message_results = json.dumps(results)
        return jsonify({"message": message_results}), 400

    db_connection = get_db_connection()
    db_cursor = db_connection.cursor()
    try:
        db_cursor.execute(query)
        if db_cursor.description:  # Check if query response includes rows
            rows = db_cursor.fetchall()
            transposed_rows = list(zip(*rows))
            columns = [desc[0] for desc in db_cursor.description]
            db_cursor.close()
            db_connection.close()
            results = {columns[row]: list(transposed_rows[row]) for row in range(len(columns))}
            message_results = json.dumps(results)
            return jsonify({"message": message_results}), 200
        else:
            db_connection.commit()
            db_cursor.close()
            db_connection.close()
            results = {"ResponseSource": ["No Data - No Rows"], "Message":["Query executed successfully"]}
            message_results = json.dumps(results)
            return jsonify({"message": message_results}), 201
        
    except psycopg2.Error as e:
        error_details = format_pg_error(e)
        db_cursor.close()
        db_connection.close()
        results = {"ResponseSource": ["No Data - psycopg2 Error"], "Message":[error_details['error']]}
        message_results = json.dumps(results)
        return jsonify({"message": message_results}), 400

    except Exception as e:
        db_cursor.close()
        db_connection.close()
        results = {"ResponseSource": ["No Data - General Exception"], "Message":[repr(e)]}
        message_results = json.dumps(results)
        return jsonify({"message": message_results}), 500

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

@app.route('/lab-material-three')
def lab_material_three():
    return render_template('lab-material-three.html')

@app.route('/lab-material-four')
def lab_material_four():
    return render_template('lab-material-four.html')

@app.route('/lab-material-five')
def lab_material_five():
    return render_template('lab-material-five.html')

@app.route('/lab-material-six')
def lab_material_six():
    return render_template('lab-material-six.html')

@app.route('/lab-material-seven')
def lab_material_seven():
    return render_template('lab-material-seven.html')

@app.route('/lab-material-eight')
def lab_material_eight():
    return render_template('lab-material-eight.html')

@app.route('/lab-material-nine')
def lab_material_nine():
    return render_template('lab-material-nine.html')

@app.route('/lab-material-ten')
def lab_material_ten():
    return render_template('lab-material-ten.html')

@app.route('/lab-material-eleven')
def lab_material_eleven():
    return render_template('lab-material-eleven.html')

@app.route('/practice-query-one')
def practice_query_one():
    return render_template('practice-query-one.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)