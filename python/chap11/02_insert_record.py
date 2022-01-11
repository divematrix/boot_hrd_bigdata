import sqlite3

conn = sqlite3.connect('test.db')
cursor = conn.cursor()

cursor.execute('''
insert into phonebook(name, phone, email) values(?,?,?)
''',('강호동', '010-1111-1111', 'hodong@company.com'))

cursor.execute('''
insert into phonebook(name, phone, email) values(?,?,?)
''',('유재석', '010-2222-2222', 'jaesuk@you.com'))

conn.commit()

cursor.close()
conn.close()