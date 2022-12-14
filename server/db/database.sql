CREATE DATABASE IF NOT EXISTS userbooks;

USE userbooks;

CREATE TABLE IF NOT EXISTS countries (
    ISO3 VARCHAR(3) NOT NULL,
    cname VARCHAR(45) NOT NULL,
    phone_ext VARCHAR(4) NOT NULL,
    PRIMARY KEY (ISO3)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    uname VARCHAR(25) NOT NULL,
    surname VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    phone_ext VARCHAR(3) NOT NULL,
    phone_num VARCHAR(15) NOT NULL,
    country VARCHAR(3) NOT NULL,
    birth_date DATE NOT NULL,
    user_since DATETIME NOT NULL,
    passwd VARCHAR(44) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (phone_ext) REFERENCES countries(ISO3) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (country) REFERENCES countries(ISO3) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS books_genre (
    id INT NOT NULL AUTO_INCREMENT,
    genre VARCHAR(35) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS books (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(45) NOT NULL,
    author VARCHAR(50) NOT NULL,
    thumbnail VARCHAR(55) NOT NULL,
    publication_date DATE NOT NULL,
    page_count INT NOT NULL,
    genre INT NOT NULL,
    FOREIGN KEY (genre) REFERENCES books_genre(id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS user_book (
    id INT NOT NULL AUTO_INCREMENT,
    user INT NOT NULL,
    book INT NOT NULL,
    purchased DATETIME NOT NULL,
    readed TINYINT(1) NOT NULL,
    page_index INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (book) REFERENCES books(id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB;



-- DATA

-- countries
INSERT INTO countries (ISO3, cname, phone_ext) VALUES ('AFG', 'Afghanistan', '93'), ('ALB', 'Albania', '355'), ('DEU', 'Germany', '49') , ('DZA', 'Algeria', '213') , ('AND', 'Andorra', '376') , ('AGO', 'Angola', '244') , ('AIA', 'Anguilla', '264') , ('ATA', 'Antarctica', '672') , ('ATG', 'Antigua and Barbuda', '268') , ('ANT', 'Netherlands Antilles', '599') , ('SAU', 'Saudi Arabia', '966') , ('ARG', 'Argentina', '54') , ('ARM', 'Armenia', '374') , ('ABW', 'Aruba', '297') , ('AUS', 'Australia', '61') , ('AUT', 'Austria', '43') , ('AZE', 'Azerbaijan', '994') , ('BEL', 'Belgium', '32') , ('BHS', 'Bahamas', '242') , ('BHR', 'Bahrain', '973') , ('BGD', 'Bangladesh', '880') , ('BRB', 'Barbados', '246') , ('BLZ', 'Belize', '501') , ('BEN', 'Benin', '229') , ('BTN', 'Bhutan', '975') , ('BLR', 'Belarus', '375') , ('MMR', 'Myanmar', '95') , ('BOL', 'Bolivia', '591') , ('BIH', 'Bosnia and Herzegovina', '387') , ('BWA', 'Botswana', '267') , ('BRA', 'Brazil', '55') , ('BRN', 'Brunei', '673') , ('BGR', 'Bulgaria', '359') , ('BFA', 'Burkina Faso', '226') , ('BDI', 'Burundi', '257') , ('CPV', 'Cape Verde', '238') , ('KHM', 'Cambodia', '855') , ('CMR', 'Cameroon', '237') , ('CAN', 'Canada', '1') , ('TCD', 'Chad', '235') , ('CHL', 'Chile', '56') , ('CHN', 'China', '86') , ('CYP', 'Cyprus', '357') , ('VAT', 'Vatican City State', '39') , ('COL', 'Colombia', '57') , ('COM', 'Comoros', '269') , ('COG', 'Congo', '242') , ('COD', 'Congo', '243') , ('PRK', 'North Korea', '850') , ('KOR', 'South Korea', '82') , ('CIV', 'Ivory Coast', '225') , ('CRI', 'Costa Rica', '506') , ('HRV', 'Croatia', '385') , ('CUB', 'Cuba', '53') , ('DNK', 'Denmark', '45') , ('DMA', 'Dominica', '767') , ('ECU', 'Ecuador', '593') , ('EGY', 'Egypt', '20') , ('SLV', 'El Salvador', '503') , ('ARE', 'United Arab Emirates', '971') , ('ERI', 'Eritrea', '291') , ('SVK', 'Slovakia', '421') , ('SVN', 'Slovenia', '386') , ('ESP', 'Spain', '34') , ('USA', 'United States of America', '1') , ('EST', 'Estonia', '372') , ('ETH', 'Ethiopia', '251') , ('PHL', 'Philippines', '63') , ('FIN', 'Finland', '358') , ('FJI', 'Fiji', '679') , ('FRA', 'France', '33') , ('GAB', 'Gabon', '241') , ('GMB', 'Gambia', '220') , ('GEO', 'Georgia', '995') , ('GHA', 'Ghana', '233') , ('GIB', 'Gibraltar', '350') , ('GRD', 'Grenada', '473') , ('GRC', 'Greece', '30') , ('GRL', 'Greenland', '299') , ('GLP', 'Guadeloupe', '') , ('GUM', 'Guam', '671') , ('GTM', 'Guatemala', '502') , ('GUF', 'French Guiana', '') , ('GGY', 'Guernsey', '') , ('GIN', 'Guinea', '224') , ('GNQ', 'Equatorial Guinea', '240') , ('GNB', 'Guinea-Bissau', '245') , ('GUY', 'Guyana', '592') , ('HTI', 'Haiti', '509') , ('HND', 'Honduras', '504') , ('HKG', 'Hong Kong', '852') , ('HUN', 'Hungary', '36') , ('IND', 'India', '91') , ('IDN', 'Indonesia', '62') , ('IRN', 'Iran', '98') , ('IRQ', 'Iraq', '964') , ('IRL', 'Ireland', '353') , ('BVT', 'Bouvet Island', '') , ('IMN', 'Isle of Man', '44') , ('CXR', 'Christmas Island', '61') , ('NFK', 'Norfolk Island', '') , ('ISL', 'Iceland', '354') , ('BMU', 'Bermuda Islands', '441') , ('CYM', 'Cayman Islands', '345') , ('CCK', 'Cocos (Keeling) Islands', '61') , ('COK', 'Cook Islands', '682') , ('ALA', '??land Islands', '') , ('FRO', 'Faroe Islands', '298') , ('SGS', 'South Georgia and the South Sandwich Islands', '') , ('HMD', 'Heard Island and McDonald Islands', '') , ('MDV', 'Maldives', '960') , ('FLK', 'Falkland Islands (Malvinas)', '500') , ('MNP', 'Northern Mariana Islands', '670') , ('MHL', 'Marshall Islands', '692') , ('PCN', 'Pitcairn Islands', '870') , ('SLB', 'Solomon Islands', '677') , ('TCA', 'Turks and Caicos Islands', '649') , ('UMI', 'United States Minor Outlying Islands', '') , ('VG', 'Virgin Islands', '284') , ('VIR', 'United States Virgin Islands', '340') , ('ISR', 'Israel', '972') , ('ITA', 'Italy', '39') , ('JAM', 'Jamaica', '876') , ('JPN', 'Japan', '81') , ('JEY', 'Jersey', '') , ('JOR', 'Jordan', '962') , ('KAZ', 'Kazakhstan', '7') , ('KEN', 'Kenya', '254') , ('KGZ', 'Kyrgyzstan', '996') , ('KIR', 'Kiribati', '686') , ('KWT', 'Kuwait', '965') , ('LBN', 'Lebanon', '961') , ('LAO', 'Laos', '856') , ('LSO', 'Lesotho', '266') , ('LVA', 'Latvia', '371') , ('LBR', 'Liberia', '231') , ('LBY', 'Libya', '218') , ('LIE', 'Liechtenstein', '423') , ('LTU', 'Lithuania', '370') , ('LUX', 'Luxembourg', '352') , ('MEX', 'Mexico', '52') , ('MCO', 'Monaco', '377') , ('MAC', 'Macao', '853') , ('MKD', 'Macedonia', '389') , ('MDG', 'Madagascar', '261') , ('MYS', 'Malaysia', '60') , ('MWI', 'Malawi', '265') , ('MLI', 'Mali', '223') , ('MLT', 'Malta', '356') , ('MAR', 'Morocco', '212') , ('MTQ', 'Martinique', '') , ('MUS', 'Mauritius', '230') , ('MRT', 'Mauritania', '222') , ('MYT', 'Mayotte', '262') , ('FSM', 'Estados Federados de', '691') , ('MDA', 'Moldova', '373') , ('MNG', 'Mongolia', '976') , ('MNE', 'Montenegro', '382') , ('MSR', 'Montserrat', '664') , ('MOZ', 'Mozambique', '258') , ('NAM', 'Namibia', '264') , ('NRU', 'Nauru', '674') , ('NPL', 'Nepal', '977') , ('NIC', 'Nicaragua', '505') , ('NER', 'Niger', '227') , ('NGA', 'Nigeria', '234') , ('NIU', 'Niue', '683') , ('NOR', 'Norway', '47') , ('NCL', 'New Caledonia', '687') , ('NZL', 'New Zealand', '64') , ('OMN', 'Oman', '968') , ('NLD', 'Netherlands', '31') , ('PAK', 'Pakistan', '92') , ('PLW', 'Palau', '680') , ('PSE', 'Palestine', '') , ('PAN', 'Panama', '507') , ('PNG', 'Papua New Guinea', '675') , ('PRY', 'Paraguay', '595') , ('PER', 'Peru', '51') , ('PYF', 'French Polynesia', '689') , ('POL', 'Poland', '48') , ('PRT', 'Portugal', '351') , ('PRI', 'Puerto Rico', '1') , ('QAT', 'Qatar', '974') , ('GBR', 'United Kingdom', '44') , ('CAF', 'Central African Republic', '236') , ('CZE', 'Czech Republic', '420') , ('DOM', 'Dominican Republic', '809') , ('REU', 'R??union', '') , ('RWA', 'Rwanda', '250') , ('ROU', 'Romania', '40') , ('RUS', 'Russia', '7') , ('ESH', 'Western Sahara', '') , ('WSM', 'Samoa', '685') , ('ASM', 'American Samoa', '684') , ('BLM', 'Saint Barth??lemy', '590') , ('KNA', 'Saint Kitts and Nevis', '869') , ('SMR', 'San Marino', '378') , ('MAF', 'Saint Martin (French part)', '599') , ('SPM', 'Saint Pierre and Miquelon', '508') , ('VCT', 'Saint Vincent and the Grenadines', '784') , ('SHN', 'Ascensi??n y Trist??n de Acu??a', '290') , ('LCA', 'Saint Lucia', '758') , ('STP', 'Sao Tome and Principe', '239') , ('SEN', 'Senegal', '221') , ('SRB', 'Serbia', '381') , ('SYC', 'Seychelles', '248') , ('SLE', 'Sierra Leone', '232') , ('SGP', 'Singapore', '65') , ('SYR', 'Syria', '963') , ('SOM', 'Somalia', '252') , ('LKA', 'Sri Lanka', '94') , ('ZAF', 'South Africa', '27') , ('SDN', 'Sudan', '249') , ('SWE', 'Sweden', '46') , ('CHE', 'Switzerland', '41') , ('SUR', 'Suriname', '597') , ('SJM', 'Svalbard and Jan Mayen', '') , ('SWZ', 'Swaziland', '268') , ('TJK', 'Tajikistan', '992') , ('THA', 'Thailand', '66') , ('TWN', 'Taiwan', '886') , ('TZA', 'Tanzania', '255') , ('IOT', 'British Indian Ocean Territory', '') , ('ATF', 'French Southern Territories', '') , ('TLS', 'East Timor', '670') , ('TGO', 'Togo', '228') , ('TKL', 'Tokelau', '690') , ('TON', 'Tonga', '676') , ('TTO', 'Trinidad and Tobago', '868') , ('TUN', 'Tunisia', '216') , ('TKM', 'Turkmenistan', '993') , ('TUR', 'Turkey', '90') , ('TUV', 'Tuvalu', '688') , ('UKR', 'Ukraine', '380') , ('UGA', 'Uganda', '256') , ('URY', 'Uruguay', '598') , ('UZB', 'Uzbekistan', '998') , ('VUT', 'Vanuatu', '678') , ('VEN', 'Venezuela', '58') , ('VNM', 'Vietnam', '84') , ('WLF', 'Wallis and Futuna', '681') , ('YEM', 'Yemen', '967') , ('DJI', 'Djibouti', '253') , ('ZMB', 'Zambia', '260') , ('ZWE', 'Zimbabwe', '263');

-- genre
INSERT INTO books_genre (id, genre) VALUES (1, 'Fiction'), (2, 'Fantasy'), (3, 'Science Fiction'), (4, 'Terror'), (5, 'Romance'), (6, 'Adventure');


-- users //Passwd is Passwd12345! bcrypt encrypted
INSERT INTO users VALUES (1, 'test1', 'testing1', 'test1@test.test', 'ESP', '123123123', 'ESP', '1997-07-27', (NOW()), 'ewI1CYZZGfGZqt7LnlnUQmZPF7+gMwRrpkoMqHd8QuE=');
INSERT INTO users VALUES (2, 'test2', 'testing2', 'test2@test.test', 'ESP', '123123123', 'ESP', '1997-07-27', (NOW()), 'ewI1CYZZGfGZqt7LnlnUQmZPF7+gMwRrpkoMqHd8QuE=');

-- books
INSERT INTO books (id, title, author, thumbnail, publication_date, page_count, genre)
VALUES
    (1, 'Harry Potter', 'J.K. Rowling', 'harrypotter', '1997-06-30', 3407, 1),
    (2, 'The Lord of the Rings', 'J.R.R. Tolkien', 'tlotr', '1954-07-29', 1216, 2),
    (3, 'The Hobbit', 'J.R.R. Tolkien', 'thehobbit', '1937-09-21', 310, 2),
    (4, 'The Hitchhikers Guide to the Galaxy', 'Douglas Adams', 'hitchhikersguidegalaxy', '1979-10-12', 224, 3),
    (5, 'The Silmarillion', 'J.R.R. Tolkien', 'thesilmarillion', '1977-09-15', 432, 4),
    (6, 'The Alchemist', 'Paulo Coelho', 'thealchemist', '1988-08-01', 197, 2),
    (7, 'To Kill a Mockingbird', 'Harper Lee', 'tokillamockingbird', '1960-07-11', 281, 1),
    (8, 'Pride and Prejudice', 'Jane Austen', 'prideandprejudice', '1813-01-28', 279, 1),
    (9, 'The Catcher in the Rye', 'J. D. Salinger', 'thecatcherintherye', '1951-07-16', 277, 1),
    (10, 'The Great Gatsby', 'F. Scott Fitzgerald', 'thegreatgatsby', '1925-04-10', 218, 3),
    (11, 'One Hundred Years of Solitude', 'Gabriel Garc??a M??rquez', 'onehundredyearsofsolitude', '1967-05-30', 417, 5),
    (12, 'Moby-Dick', 'Herman Melville', 'mobydick', '1851-10-18', 635, 6),
    (13, 'The Brothers Karamazov', 'Fyodor Dostoevsky', 'thebrotherskaramazov', '1880-01-01', 824, 4),
    (14, 'War and Peace', 'Leo Tolstoy', 'warandpeace', '1869-01-01', 1296, 2),
    (15, 'Frankenstein', 'Mary Shelley', 'frankenstein, Hughes, Harding, Mavor, & Jones', '1818-01-01', 280, 3);

-- user_books
INSERT INTO user_book (id, user, book, purchased, readed, page_index) VALUES (1, 1, 1, '2022-01-01 12:00:00', 0, 12), (2, 1, 2, '2022-02-01 15:00:00', 1, 34), (3, 1, 3, '2022-03-01 18:00:00', 0, 56), (4, 1, 4, '2022-04-01 21:00:00', 1, 78), (5, 1, 5, '2022-05-01 00:00:00', 0, 90), (6, 1, 6, '2022-06-01 03:00:00', 1, 102), (7, 1, 7, '2022-07-01 06:00:00', 0, 114), (8, 1, 8, '2022-08-01 09:00:00', 1, 126), (9, 1, 9, '2022-09-01 12:00:00', 0, 138), (10, 1, 10, '2022-10-01 15:00:00', 1, 150), (11, 1, 11, '2022-11-01 18:00:00', 0, 162), (12, 1, 12, '2022-12-01 21:00:00', 1, 174), (13, 1, 13, '2023-01-01 00:00:00', 0, 186), (14, 1, 14, '2023-02-01 03:00:00', 1, 198);