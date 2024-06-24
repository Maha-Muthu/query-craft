import os
from flask import Flask, render_template, request, redirect, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
import psycopg2

app = Flask(__name__)

# Database connection
def get_db_connection():
    conn = psycopg2.connect(
        dbname='postgres',
        user='postgres',
        password='password',
        host='db',  # This matches the service name in docker-compose.yml
        port='5432'
    )
    return conn

@app.route('/create_schema', methods=['POST'])
def create_schema():
    schema_name = request.json['schema_name']
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute(f"CREATE SCHEMA IF NOT EXISTS {schema_name};")
    conn.commit()
    cur.close()
    conn.close()
    return jsonify({"message": f"Schema {schema_name} created successfully"}), 201

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
    name = os.getenv('NAME', 'World')  # Default to 'World' if NAME is not set
    return render_template('index.html', name=name)


@app.route('/studenthomepage')
def student_homepage():
    return render_template('studenthomepage.html')

@app.route('/add_user', methods=['POST'])
def add_user():
    name = request.form['name']
    new_user = User(name=name)
    db.session.add(new_user)
    db.session.commit()
    return redirect('/')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)