import sqlite3

conn = sqlite3.connect('test.db')
cursor = conn.cursor()

cursor.execute('''
delete from phonebook where email=?
''',('abcd@xyz.com',))

conn.commit()

cursor.close()
conn.close()