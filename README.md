from PyPDF2 import PdfWriter

input_pdf = 'presentation.pdf'
output_pdf = 'protected_presentation.pdf'
password = 'your_password'

pdf_writer = PdfWriter()
with open(input_pdf, 'rb') as file:
    pdf_reader = PdfWriter(file)
    for page_num in range(len(pdf_reader.pages)):
        pdf_writer.add_page(pdf_reader.pages[page_num])

    # Set password
    pdf_writer.encrypt(password)
    with open(output_pdf, 'wb') as protected_file:
        pdf_writer.write(protected_file)

print("PDF protected and saved as", output_pdf)
