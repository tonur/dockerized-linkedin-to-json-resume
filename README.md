# Dockerized LinkedIn to JSON Resume Converter
Using the NPM package [linkedin-to-json-resume](https://github.com/JMPerez/linkedin-to-json-resume), this Docker image wraps the CLI component to convert a [Linkedin Data Export](https://www.linkedin.com/settings/data-export-page) .zip file into a JSON Resume format.

## Usage
1. **Download your LinkedIn data export** from [LinkedIn Settings](https://www.linkedin.com/settings/data-export-page).
2. **Run the `li2jr.sh` script** in the terminal, providing the path to your LinkedIn data export `.zip` file:
  
   ```bash
   ./li2jr.sh /path/to/your/linkedin_data_export.zip
   ```

   This will generate a `resume.json` file in the output directory.
