# Rails Web Scraper with Nokogiri and Mailer

This Rails application performs web scraping using the Nokogiri gem. It includes a mailer for development purposes and optionally uses Active Job to schedule scraping tasks. The scraper checks for specific text within a class and sends an email based on whether the text matches "match", "exit", or "not_exist".

## Features

- **Web Scraping**: Uses Nokogiri to scrape web pages.
- **Email Notifications**: Sends emails based on the scraping results.
- **Background Jobs (Optional)**: Schedules scraping tasks using Active Job.
