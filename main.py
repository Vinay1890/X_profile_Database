from bs4 import BeautifulSoup
from dotenv import load_dotenv
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import mysql.connector
import time
import os

load_dotenv() 

# Initialize the Selenium driver
PATH = 'chromedriver\chromedriver.exe'
service = Service(PATH)
driver = webdriver.Chrome(service=service)

# List of target URLs
urls = [
    "https://twitter.com/GTNUK1",
    "https://twitter.com/whatsapp",
    "https://twitter.com/aacb_CBPTrade",
    "https://twitter.com/aacbdotcom",
    "https://twitter.com/@AAWindowPRODUCT",
    "https://twitter.com/ABHomeInc",
    "https://twitter.com/Abrepro",
    "http://www.twitter.com",
    "https://twitter.com/ACChristofiLtd",
    "https://www.twitter.com/aandb_kia",
    "https://twitter.com/aeclothing1",
    "http://www.twitter.com/",
    "https://twitter.com/AETechnologies1",
    "http://www.twitter.com/wix",
    "https://twitter.com/AGInsuranceLLC",
]

# MySQL database connection
db_config = {
    'host': os.getenv('DB_HOST'),
    'user': os.getenv('DB_USER'),
    'password': os.getenv('DB_PASSWORD'),
    'database': os.getenv('DB_NAME')
}


# Connect to the database
try:
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    print("Database connection successful.")

    # Create table if it doesn't exist
    create_table_query = """
    CREATE TABLE IF NOT EXISTS twitter_profiles (
        id INT AUTO_INCREMENT PRIMARY KEY,
        profile_name VARCHAR(255),
        profile_handle VARCHAR(255),
        profile_bio TEXT,
        profile_website VARCHAR(255),
        profile_joining_date VARCHAR(255),
        profile_following VARCHAR(255),
        profile_followers VARCHAR(255)
    );
    """
    cursor.execute(create_table_query)
    conn.commit()

    for url in urls:
        driver.get(url)
        try:
            WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, "div[data-testid='UserDescription']"))
            )
            resp = driver.page_source
        except Exception as e:
            print(f"Error loading page for {url}: {e}")
            resp = driver.page_source  # Fallback to current page source

        soup = BeautifulSoup(resp, 'html.parser')
        o = {}

        try:
            o["profile_name"] = soup.find("div", {"data-testid": "UserName"}).text
        except:
            o["profile_name"] = None

        try:
            o["profile_handle"] = soup.find("div", {"data-testid": "UserScreenName"}).text
        except:
            o["profile_handle"] = None

        try:
            o["profile_bio"] = soup.find("div", {"data-testid": "UserDescription"}).text
        except:
            o["profile_bio"] = None

        profile_header = soup.find("div", {"data-testid": "UserProfileHeader_Items"})

        try:
            o["profile_website"] = profile_header.find('a').get('href')
        except:
            o["profile_website"] = None

        try:
            o["profile_joining_date"] = profile_header.find("span", {"data-testid": "UserJoinDate"}).text
        except:
            o["profile_joining_date"] = None

        try:
            o["profile_following"] = soup.find("a", {"href": f"/{url.split('/')[-1]}/following"}).find("span").text
        except:
            o["profile_following"] = None

        try:
            o["profile_followers"] = soup.find("a", {"href": f"/{url.split('/')[-1]}/followers"}).find("span").text
        except:
            o["profile_followers"] = None

        # Insert the profile data into the database
        insert_query = """
        INSERT INTO twitter_profiles 
        (profile_name, profile_handle, profile_bio, profile_website, profile_joining_date, profile_following, profile_followers)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, (
            o["profile_name"], 
            o["profile_handle"], 
            o["profile_bio"], 
            o["profile_website"], 
            o["profile_joining_date"], 
            o["profile_following"], 
            o["profile_followers"]
        ))
        conn.commit()
        print(f"Data successfully inserted for {url}")

except mysql.connector.Error as e:
    print(f"Error connecting to MySQL: {e}")
finally:
    cursor.close()
    conn.close()
    driver.quit()
    print("Database connection closed.")
