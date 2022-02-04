import subprocess

def schemas_html(schemas_filename):
	with open(schemas_filename, 'r') as f:
		return subprocess.run('sbcl --script render-schemas.lisp'.split(' '), input=bytes(f.read(), 'utf-8'), cwd='../..', capture_output=True).stdout.decode('utf-8')
