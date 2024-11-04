import webbrowser

def open_website_with_translation():
    website = input("Enter the website URL (e.g., https://www.example.com): ")
    language = input("Enter the language code to translate to (e.g., es for Spanish): ")
    translated_url = f"https://translate.google.com/translate?hl={language}&sl=auto&u={website}"
    webbrowser.open(translated_url)

open_website_with_translation()
