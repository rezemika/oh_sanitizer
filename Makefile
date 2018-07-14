freeze:
	pip freeze | grep -Ev "pkg-resources|twine" > requirements.txt

tests:
	python oh_sanitizer/main.py

benchmark:
	@echo "=== Time for a single field:"
	@python -m timeit -v -r 5 -n 1 -s 'import oh_sanitizer' 'field = oh_sanitizer.sanitize_field("mo-fr 8h-7:00 pm")'
	@echo "=== Time for 10 fields:"
	@python -m timeit -v -r 5 -n 10 -s 'import oh_sanitizer' 'field = oh_sanitizer.sanitize_field("mo-fr 8h-7:00 pm")'
	@echo "=== Time for 100 fields:"
	@python -m timeit -v -r 5 -n 100 -s 'import oh_sanitizer' 'field = oh_sanitizer.sanitize_field("mo-fr 8h-7:00 pm")'
	@echo "=== Time for 1000 fields:"
	@python -m timeit -v -r 5 -n 1000 -s 'import oh_sanitizer' 'field = oh_sanitizer.sanitize_field("mo-fr 8h-7:00 pm")'

help:
	@echo "Available commands:"
	@echo "  freeze          Updates 'requirements.txt'"
	@echo "  tests           Runs unit tests"
	@echo "  benchmark       Runs benchmark for 1, 10, 100 and 1000 fields"
