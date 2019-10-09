# Vcards

VCard creation from CSV

## Requirements

The following fields are supported:

- name
- first_name
- last_name
- email
- phone
- note

## Usage:

```bash
./exe/convert --column-separator="," \
  --file=file.csv \
  --note="Importado dia 9.10.19" \
  --limit=1 \
  --fields=first_name,last_name,email,name > contacts.vcf
```

Mandatory args:

- file
- column-separator
