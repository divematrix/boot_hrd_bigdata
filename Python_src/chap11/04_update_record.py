import sqlite3

conn = sqlite3.connect('test.db')
cursor = conn.cursor()

cursor.execute('''
update phonebook set phone=?, email=? where name=?
''',('010-1234-5678', 'abcd@xyz.com', '강호동'))

conn.commit()

cursor.close()
conn.close()