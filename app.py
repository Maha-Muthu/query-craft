import os
from flask import Flask, render_template, request, redirect, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
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

@app.route('/create-schema', methods=['POST'])
def create_schema():
    if not request.is_json:
        return jsonify({"error": "Invalid Request"}), 400
    
    schema_name = request.json.get('schemaName')    
    if not schema_name:
        return jsonify({"error": "Missing Schema Name"}), 400

    db_connection = get_db_connection()
    db_cursor = db_connection.cursor()
    try:
        db_cursor.execute(f"CREATE SCHEMA IF NOT EXISTS {schema_name};")
        db_connection.commit()
    except Exception as exception:
        db_cursor.close()
        db_connection.close()
        return jsonify({"Error ! "+str(exception)}), 500
    
    db_cursor.close()
    db_connection.close()
    return jsonify({"message": f"Schema {schema_name} created successfully"}), 201
    
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
        db_connection.commit()
    except Exception as exception:
        db_cursor.close()
        db_connection.close()
        return jsonify({"Error ! "+str(exception)}), 500
    
    db_cursor.close()
    db_connection.close()
    return jsonify({"message": f"Schema {query} created successfully"}), 201

@app.route('/create_table', methods=['POST'])
def create_table():
    schema_name = request.json['schema_name']
    table_name = request.json['table_name']
    columns = request.json['columns']  # Example: "id SERIAL PRIMARY KEY, name VARCHAR(100)"
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(f'CREATE TABLE IF NOT EXISTS {schema_name}.{table_name} ({columns})')
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Table created successfully'})

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

@app.route('/add_user', methods=['POST'])
def add_user():
    name = request.form['name']
    new_user = User(name=name)
    db.session.add(new_user)
    db.session.commit()
    return redirect('/')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)