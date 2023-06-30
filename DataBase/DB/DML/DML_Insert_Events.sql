/*
Script type: DML
Created by: Ahmad Chauhdry
Created Date: 05/20/2023
Purpose: Inserting data in events table
*/

USE [IPLVSPSL]

SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;
IF OBJECT_ID('dbo.Events', 'U') IS NOT NULL
IF NOT EXISTS (Select * from [dbo].[Events])
BEGIN
	INSERT INTO [Events]
	([Name])
	VALUES
	('ICC Women''s World Cup Qualifying Series'),
	('Pakistan v Australia ODI Series'),(
        'Ireland tour of Bangladesh'),(
        'Vanuatu tour of Malaysia'),(
        'Sri Lanka tour of India'),(
        'Indonesia tour of Japan'),(
        'Bermuda in Kenya ODI Series'),(
        'New Zealand tour of India'),(
        'Netherlands tour of New Zealand'),(
        'India Women tour of Ireland and England'),(
        'ICC World Twenty20 Africa Region Qualifier A'),(
        'Hong Kong tour of Malaysia'),(
        'West Indies in Pakistan ODI Series'),(
        'ICC Men''s T20 World Cup Europe Region Qualifier'),(
        'Kenya in Canada ODI Series'),(
        'New Zealand Women in India ODI Series'),(
        'England tour of Zimbabwe'),(
        'Sri Lanka tour of England and Ireland'),(
        'ICC World Cricket League Africa Region Qualifiers'),(
        'India in Zimbabwe ODI Series'),(
        'Netherlands in Ireland ODI Series'),(
        'India in Zimbabwe T20I Series'),(
        'India tour of United States of America and West Indies'),(
        'Afghanistan in Ireland ODI Series'),(
        'Sri Lanka Women tour of Pakistan'),(
        'Asian Cricket Council Women''s T20 Championship'),(
        'South Africa Women in Bangladesh ODI Series'),(
        'Syed Mushtaq Ali Trophy'),(
        'Sri Lanka in Australia T20I Series'),(
        'Mzansi Super League'),(
        'New Zealand tour of Bangladesh'),(
        'Future Cup'),(
        'South Africa in Zimbabwe ODI Series'),(
        'Afghanistan tour of Sri Lanka'),(
        'Zimbabwe in New Zealand T20I Series'),(
        'New Zealand in India T20I Series'),(
        'ICC World Twenty20 East Asia-Pacific Region Qualifier A'),(
        'MCC Spirit of Cricket Test Series'),(
        'India Women tour of South Africa'),(
        'Bangladesh tour of Pakistan'),(
        'England Women in Sri Lanka ODI Series'),(
        'Bangladesh Women tour of South Africa'),(
        'ICC Men''s T20 World Cup Asia A Qualifier'),(
        'England in South Africa ODI Series'),(
        'Papua New Guinea v Scotland T20I Match'),(
        'New Zealand Women tour of England'),(
        'ACC Western Region T20'),(
        'West Indies tour of Sri Lanka'),(
        'South Africa Women tour of India'),(
        'India Women in West Indies'),(
        'Sri Lanka Women tour of Malaysia'),(
        'South Africa in India ODI Series'),(
        'South Asian Games Men''s Cricket Competition'),(
        'Sri Lanka tour of New Zealand'),(
        'Asian Cricket Council Elite League'),(
        'Pakistan v New Zealand Test Series'),(
        'Finland tour of Denmark'),(
        'West Indies tour of India'),(
        'ICC Women''s T20 World Cup East Asia-Pacific Region Qualifier'),(
        'ICC Cricket World Cup Qualifier'),(
        'ICC World Test Championship'),(
        'Pakistan in India T20I Series'),(
        'Bangladesh in New Zealand Test Series'),(
        'Zimbabwe in Bangladesh T20I Series'),(
        'Women''s T20I Quadrangular Series (in Netherlands)'),(
        'Germany tour of Spain'),(
        'CWC Challenge League'),(
        'Zimbabwe tour of Bangladesh'),(
        'United Arab Emirates Tri-Nation Series'),(
        'Botswana Women tour of Namibia'),(
        'Ireland Women tour of Zimbabwe'),(
        'New Zealand in South Africa Test Series'),(
        'SA20'),(
        'ICC Women''s World Cup'),(
        'England tour of South Africa'),(
        'England tour of Sri Lanka'),(
        'South Africa in New Zealand Test Series'),(
        'England in India Test Series'),(
        'Australia Women tour of England'),(
        'Bangladesh Women in Ireland T20I Series'),(
        'England in Sri Lanka ODI Series'),(
        'ICC World Twenty20 Qualifier'),(
        'West Indies tour of Bangladesh'),(
        'Ghana tour of Rwanda'),(
        'Pakistan v South Africa Test Series'),(
        'Netherlands Tri-Nation T20I Series'),(
        'Ireland tour of England'),(
        'Kitply Cup'),(
        'Inter-Insular Women''s Twenty20 Series'),(
        'India tour of Bangladesh'),(
        'Australia Women tour of India'),(
        'ICC Women''s T20 World Cup Africa Region Qualifier'),(
        'Commonwealth Games Women''s Cricket Competition'),(
        'Bangladesh in Sri Lanka ODI Series'),(
        'Sri Lanka in Pakistan ODI Series'),(
        'ICC Women''s World Twenty20 Qualifier'),(
        'Bangladesh in England Test Series'),(
        'Pakistan v Sri Lanka Test Series'),(
        'Australia Women v Pakistan Women T20I Series'),(
        'Pakistan Women in West Indies T20I Series'),(
        'Papua New Guinea v Ireland T20I Series'),(
        'LV= County Championship'),(
        'Bangladesh in Zimbabwe T20I Series'),(
        'Asian Cricket Council Women''s Twenty20 Asia Cup'),(
        'ICC World Twenty20 East Asia-Pacific Region Qualifier B'),(
        'Pakistan tour of Netherlands'),(
        'South Africa tour of England'),(
        'Bangladesh in Netherlands T20I Series'),(
        'Australia Tri-Nation Women''s T20 Series'),(
        'Zimbabwe in South Africa ODI Series'),(
        'South Africa tour of Pakistan'),(
        'Nigeria Women tour of Rwanda'),(
        'Bangladesh tour of United Arab Emirates'),(
        'Women''s Cricket Super League'),(
        'Afghanistan in West Indies ODI Series'),(
        'South Africa Women tour of West Indies'),(
        'Pakistan tour of England'),(
        'Afghanistan tour of Ireland'),(
        'Australia in West Indies T20I Series'),(
        'Bangladesh Women in Pakistan ODI Series'),(
        'Pakistan Super League'),(
        'Australia in South Africa ODI Series'),(
        'Capricorn Women''s Tri-Series'),(
        'West Indies in Bangladesh Test Series'),(
        'ICC Women''s T20 World Cup'),(
        'Nepal Women tour of Qatar'),(
        'ICC Men''s T20 World Cup Sub Regional Europe Qualifier'),(
        'Sri Lanka tour of Zimbabwe'),(
        'South Africa tour of West Indies'),(
        'ICC Intercontinental Cup'),(
        'South Africa tour of New Zealand'),(
        'ICC World Cricket League Division Four'),(
        'West Indies tour of England and Ireland'),(
        'South Africa in England ODI Series'),(
        'Netherlands Women tour of Ireland'),(
        'India tour of Sri Lanka'),(
        'Zimbabwe Women tour of Bangladesh'),(
        'ICC Women''s World Twenty20 Qualifying Series European-Americas Region'),(
        'Belgium tour of Malta'),(
        'Pakistan Women tour of South Africa'),(
        'Pakistan Women in England ODI Series'),(
        'ICC World Cricket League Europe Region Division Two Twenty20'),(
        'Sri Lanka in West Indies ODI Series'),(
        'England in Australia ODI Series'),(
        'England Women in New Zealand T20I Series'),(
        'Pakistan Women in England T20I Series'),(
        'Asian Cricket Council Premier League'),(
        'West Indies Women tour of Sri Lanka'),(
        'West Indies tour of Pakistan'),(
        'HRV Cup'),(
        'South Africa in Sri Lanka T20I Series'),(
        'Tri-Nation Tournament in Kenya'),(
        'Valletta Cup'),(
        'Bangladesh in West Indies ODI Series'),(
        'West Indies Women in Sri Lanka ODI Series'),(
        'Sri Lanka Women tour of Australia'),(
        'Sri Lanka in New Zealand T20I Series'),(
        'India Women tour of New Zealand'),(
        'ICC World Cricket League Americas Region Division One Twenty20'),(
        'Zimbabwe in Kenya ODI Series'),(
        'ICC Women''s Cricket World Cup Qualifier'),(
        'Sri Lanka in India T20I Series'),(
        'Ireland in United Arab Emirates T20I Series'),(
        'Uganda T20 Tri-Series'),(
        'India tour of Zimbabwe'),(
        'Pakistan in South Africa ODI Series'),(
        'New Zealand tour of West Indies'),(
        'South Africa in Pakistan ODI Series'),(
        'South Africa in West Indies Test Series'),(
        'South Africa in Bangladesh Test Series'),(
        'England Women tour of Australia'),(
        'Rachael Heyhoe Flint Trophy'),(
        'ICC World XI tour of Australia'),(
        'West Indies Women tour of Pakistan'),(
        'Oman Pentangular T20I Series'),(
        'Australia tour of Sri Lanka'),(
        'Hong Kong in Ireland T20I Series'),(
        'Ireland Women tour of Pakistan'),(
        'Afghanistan v Kenya T20I Series'),(
        'Quadrangular Twenty20 Series (Malaysia)'),(
        'ICC Men''s T20 World Cup East Asia-Pacific Region Qualifier A'),(
        'NatWest Challenge'),(
        'ICC Men''s T20 World Cup Americas Region Final'),(
        'ICC World Cricket League Division Eight'),(
        'Ireland in England ODI Series'),(
        'Nepal tour of Kenya'),(
        'New Zealand tour of Scotland'),(
        'Women''s T20 Pentangular Series (in Spain)'),(
        'International League T20'),(
        'Women''s T20 Blaze'),(
        'Portugal T20 Tri-Series'),(
        'India tour of New Zealand'),(
        'ICC World Twenty20'),(
        'VB Series'),(
        'Bangladesh in South Africa Test Series'),(
        'India tour of West Indies'),(
        'Uganda tour of Namibia'),(
        'Afghanistan tour of India'),(
        'England in Bangladesh Test Series'),(
        'West Indies in South Africa ODI Series'),(
        'South Africa Women in Sri Lanka ODI Series'),(
        'Inter-Insular T20 Series'),(
        'Pakistan in England T20I Series'),(
        'England Women ODI tour of Malaysia'),(
        'New Zealand tour of Zimbabwe'),(
        'India in Pakistan ODI Series'),(
        'South Africa in India T20I Series'),(
        'ICC Men''s T20 World Cup Europe Region Final'),(
        'West Indies Women in Australia ODI Series'),(
        'India tour of Ireland'),(
        'New Zealand tour of Sri Lanka'),(
        'Australia tour of India'),(
        'Ireland tour of India'),(
        'New Zealand in Zimbabwe T20I Series'),(
        'West Indies tour of Zimbabwe'),(
        'India Women tour of England'),(
        'West Indies in Australia ODI Series'),(
        'Netherlands Women tour of Thailand'),(
        'Australia tour of England and Scotland'),(
        'Pakistan v South Africa T20I Series'),(
        'Women''s Twenty20 East Asia Cup'),(
        'West Indies tour of Australia'),(
        'ICC Men''s T20 World Cup Sub Regional Europe Qualifier Group C'),(
        'GCC Women''s Twenty20 Championship Cup'),(
        'ICC Men''s T20 World Cup East Asia-Pacific Region Qualifier B'),(
        'New Zealand in West Indies Test Series'),(
        'England tour of India'),(
        'Zimbabwe tour of Australia'),(
        'Pakistan Women in New Zealand ODI Series'),(
        'The Ashes'),(
        'Sri Lanka in New Zealand ODI Series'),(
        'Paktel Cup'),(
        'New Zealand v West Indies T20I Series'),(
        'South Africa in India Test Series'),(
        'India in England ODI Series'),(
        'Afghanistan v Zimbabwe T20I Series'),(
        'ICC Men''s T20 World Cup'),(
        'Cyprus T20 Tri-Series'),(
        'Pakistan tour of Australia'),(
        'NatWest Women''s T20 Quadrangular Series'),(
        'New Zealand tour of South Africa'),(
        'Scotland in Ireland ODI Series'),(
        'South Africa Women in Ireland ODI Series'),(
        'England tour of Netherlands'),(
        'Women''s Quadrangular Series'),(
        'ICC Men''s T20 World Cup Qualifier A'),(
        'Pakistan Women v Sri Lanka Women T20I Series'),(
        'World Cup'),(
        'Pakistan tour of India'),(
        'Australia Women tour of New Zealand'),(
        'Ireland tour of Netherlands'),(
        'Zimbabwe in West Indies ODI Series'),(
        'European Championship Division One'),(
        'Bahrain tour of Oman'),(
        'Oman Quadrangular T20I Series'),(
        'Pakistan in India ODI Series'),(
        'England tour of West Indies'),(
        'Sweden tour of Finland'),(
        'Pakistan Women tour of West Indies'),(
        'Zimbabwe tour of Sri Lanka'),(
        'Bulgaria tour of Serbia'),(
        'Pakistan in Sri Lanka Test Series'),(
        'Asia Cup'),(
        'India Women v South Africa Women'),(
        'Pakistan tour of Ireland, England and Scotland'),(
        'Sri Lanka in South Africa ODI Series'),(
        'Afghanistan in Bangladesh ODI Series'),(
        'ICC Men''s T20 World Cup Americas Region Qualifier'),(
        'Australia tour of United Arab Emirates'),(
        'India in New Zealand T20I Series'),(
        'Pakistan v England T20I Series'),(
        'Ireland Tri-Nation Series'),(
        'Women''s World T20'),(
        'Bangladesh tour of Sri Lanka'),(
        'Indian Premier League'),(
        'ICC Cricket World Cup Qualifier Play-off'),(
        'ACC Eastern Region T20'),(
        'Bangladesh in New Zealand T20I Series'),(
        'ICC World XI tour of England'),(
        'England in Sri Lanka Test Series'),(
        'Bangladesh Women in South Africa ODI Series'),(
        'Bangladesh in South Africa ODI Series'),(
        'Sri Lanka Women tour of South Africa'),(
        'New Zealand Women in South Africa ODI Series'),(
        'T20 Canada'),(
        'Ram Slam T20 Challenge'),(
        'Australia in India ODI Series'),(
        'Nepal Tri-Nation T20I Series'),(
        'Pakistan tour of South Africa'),(
        'Continental Cup'),(
        'Commonwealth Bank Series'),(
        'CSA T20 Challenge'),(
        'Tri-Nation Tournament in Bangladesh'),(
        'Kenya Women tour of Malaysia'),(
        'Australia in England T20I Series'),(
        'Sri Lanka tour of Pakistan'),(
        'South Africa in Australia T20I Series'),(
        'ICC Women''s World Twenty20 Qualifying Series Africa Region'),(
        'Bangladesh tour of India'),(
        'Zimbabwe in Bangladesh ODI Series'),(
        'India in Bangladesh ODI Series'),(
        'PCB Qatar Women''s 20-over Tri-Series'),(
        'Bangladesh Women in Pakistan T20I Series'),(
        'Pakistan in Australia Test Series'),(
        'The Frank Worrell Trophy'),(
        'West Indies in Bangladesh ODI Series'),(
        'Zimbabwe in Bangladesh Test Series'),(
        'Super Smash'),(
        'New Zealand tour of United Arab Emirates'),(
        'South Africa Women tour of New Zealand'),(
        'Pakistan in New Zealand Test Series'),(
        'Sri Lanka in Zimbabwe Test Series'),(
        'India tour of South Africa'),(
        'Sir Vivian Richards Trophy'),(
        'Ireland Tri-Nation T20I Series'),(
        'India in New Zealand Test Series'),(
        'Germany T20 Tri-Series'),(
        'Ireland in West Indies T20I Series'),(
        'ICC Women''s T20 World Cup Europe Region Qualifier'),(
        'India Women in Australia T20I Series'),(
        'Pakistan in Sri Lanka ODI Series'),(
        'Asia Cup Qualifiers'),(
        'Bangladesh in Sri Lanka Test Series'),(
        'West Indies in New Zealand T20I Series'),(
        'India in South Africa ODI Series'),(
        'Pakistan v New Zealand ODI Series'),(
        'Australia in India Test Series'),(
        'Ireland in Kenya T20I Series'),(
        'Hong Kong v Oman T20I Series'),(
        'England Women tour of Sri Lanka'),(
        'Pakistan in Australia ODI Series'),(
        'South Africa in Bangladesh ODI Series'),(
        'NatWest T20 Blast'),(
        'India in West Indies ODI Series'),(
        'FairBreak Invitational Tournament'),(
        'Australia in New Zealand T20I Series'),(
        'New Zealand in India Test Series'),(
        'Scotland tour of Netherlands'),(
        'Bangladesh in Ireland ODI Series'),(
        'ICC World Cricket League Championship'),(
        'Zimbabwe in Pakistan ODI Series'),(
        'ICC World Twenty20 Africa Region Qualifier B'),(
        'Ireland tour of Zimbabwe'),(
        'Afghanistan in Zimbabwe T20I Series'),(
        'New Zealand tour of Ireland'),(
        'England Women tour of New Zealand'),(
        'Marsh Sheffield Shield'),(
        'Indian Oil Cup'),(
        'Zimbabwe tour of United Arab Emirates'),(
        'Nepal v Papua New Guinea ODI Series'),(
        'India tour of Ireland and England'),(
        'New Zealand in England Test Series'),(
        'Pakistan in South Africa Test Series'),(
        'Pakistan v Sri Lanka T20I Series'),(
        'Sweden tour of Denmark'),(
        'Women''s Quadrangular Series (in South Africa)'),(
        'India in New Zealand ODI Series'),(
        'Afghanistan v Zimbabwe'),(
        'Kenya Quadrangular Women''s T20 Series'),(
        'Bangladesh tour of England'),(
        'Spain Triangular T20I Series'),(
        'Singapore Women tour of Cambodia'),(
        'Gibraltar tour of Portugal'),(
        'ICC World Twenty20 Asia Region Qualifier B'),(
        'Women''s Ashes'),(
        'Australia tour of South Africa'),(
        'Isle of Man tour of Spain'),(
        'Germany Women tour of Austria'),(
        'Pakistan v England Test Series'),(
        'India in Sri Lanka Test Series'),(
        'ICC Men''s T20 World Cup Qualifier'),(
        'Bangladesh Women tour of New Zealand'),(
        'ICC Champions Trophy'),(
        'India tour of Ireland, England and Scotland'),(
        'England in South Africa T20I Series'),(
        'Oman tour of United Arab Emirates'),(
        'ICC World Twenty20 Africa Region Qualifier C'),(
        'Papua New Guinea in United Arab Emirates ODI Series'),(
        'ICC World Cricket League Europe Region Division One'),(
        'Desert Cup T20I Series'),(
        'Clive Lloyd Trophy'),(
        'West Indies in Sri Lanka ODI Series'),(
        'Pakistan in South Africa T20I Series'),(
        'Pakistan tour of Sri Lanka'),(
        'Africa Cricket Association Cup'),(
        'Canada v Kenya T20I Series'),(
        'Independence Cup'),(
        'Women''s T20 Challenge Match'),(
        'Pakistan Women tour of Zimbabwe'),(
        'ICC Intercontinental Shield'),(
        'England Women in South Africa ODI Series'),(
        'England tour of Australia'),(
        'Women''s Caribbean Premier League'),(
        'West Indies tour of Netherlands'),(
        'Bangladesh in Kenya ODI Series'),(
        'ICC World Cup'),(
        'Bangladesh Twenty20 Tri-Series'),(
        'Australia Women in Sri Lanka ODI Series'),(
        'Women''s T20I Quadrangular Series (in UAE)'),(
        'England in West Indies T20I Series'),(
        'Australia in South Africa Test Series'),(
        'Zimbabwe in Pakistan T20I Series'),(
        'Kenya in Scotland ODI Series'),(
        'TVS Cup (Bangladesh)'),(
        'Papua New Guinea in Hong Kong ODI Series'),(
        'Pakistan Women in Australia T20I Series'),(
        'Sofia Twenty20'),(
        'India Tri-Nation Women''s T20 Series'),(
        'Sri Lanka tour of England and Scotland'),(
        'Kwibuka Women''s Twenty20 Tournament'),(
        'ICC Men''s T20 World Cup Sub Regional Africa Qualifier'),(
        'Papua New Guinea in United Arab Emirates T20I Series'),(
        'Afghanistan Premier League'),(
        'Afghanistan v Scotland T20I Series'),(
        'Netherlands tour of South Africa'),(
        'Sri Lanka tour of West Indies'),(
        'Sri Lanka in India Test Series'),(
        'South Africa tour of India'),(
        'County Championship'),(
        'Afghanistan in West Indies T20I Series'),(
        'Botswana Cricket Association Women''s T20I Series'),(
        'MiWAY T20 Challenge'),(
        'Pakistan v West Indies ODI Series'),(
        'Bangladesh tour of New Zealand'),(
        'South Africa Women in England T20I Series'),(
        'ICC Cricket World Cup Qualifier (ICC Trophy)'),(
        'ICC World Cricket League Division Three'),(
        'Scotland Women tour of Malaysia'),(
        'Iberia Cup'),(
        'Nidahas Trophy'),(
        'ICC World Cricket League Division Five'),(
        'England tour of Bangladesh'),(
        'South Africa in New Zealand ODI Series'),(
        'India v England'),(
        'West Indies Women tour of Pakistan and United Arab Emirates'),(
        'Afghanistan v Oman T20I Series'),(
        'South Africa in West Indies T20I Series'),(
        'Bangladesh Premier League'),(
        'South Africa in Sri Lanka Test Series'),(
        'West Indies in Sri Lanka Test Series'),(
        'Pakistan v New Zealand T20I Series'),(
        'Warne-Muralitharan Trophy'),(
        'Australia in Bangladesh ODI Series'),(
        'Bangladesh in Pakistan ODI Series'),(
        'Australia Women tour of West Indies'),(
        'Afghanistan tour of England and Scotland'),(
        'New Zealand in South Africa T20I Series'),(
        'Zimbabwe tour of South Africa'),(
        'New Zealand tour of Pakistan'),(
        'Sri Lanka in England Test Series'),(
        'France Women tour of Germany'),(
        'ACC Twenty20 Cup'),(
        'East Asia Cup'),(
        'New Zealand Women tour of Ireland and England'),(
        'Women''s T20 Challenge'),(
        'India tour of Pakistan'),(
        'Australia Women in England ODI Series'),(
        'Bermuda in Canada ODI Series'),(
        'New Zealand in Sri Lanka T20I Series'),(
        'Thailand Women tour of Zimbabwe'),(
        'Sri Lanka in Bangladesh ODI Series'),(
        'Saudari Cup'),(
        'United Arab Emirates tour of Netherlands'),(
        'South Africa in England T20I Series'),(
        'Sierra Leone tour of Nigeria'),(
        'Namibia tour of United Arab Emirates'),(
        'New Zealand Women tour of West Indies'),(
        'ICC Men''s Cricket World Cup League 2'),(
        'Carlton Mid One-Day International Tri-Series'),(
        'Walton T20 Cricket Series'),(
        'Bangladesh in Pakistan Test Series'),(
        'Nepal tour of Malaysia'),(
        'Pakistan Women tour of Australia'),(
        'India Women in England T20I Series'),(
        'Papua New Guinea v United States of America ODI Series'),(
        'Pakistan v Sri Lanka ODI Series'),(
        'Pakistan v Australia Test Series'),(
        'England Women tour of Australia and New Zealand'),(
        'Singapore Twenty20 Tri-Series'),(
        'Hong Kong in Scotland ODI Series'),(
        'Germany Women tour of Oman'),(
        'Ireland tour of United States of America and West Indies'),(
        'ICC Women''s World Twenty20 Qualifying Series East Asia-Pacific Region'),(
        'West Indies v Sri Lanka'),(
        'Bangladesh Women in South Africa T20I Series'),(
        'Bangladesh in India Test Series'),(
        'West Indies in England T20I Series'),(
        'Bangladesh in New Zealand ODI Series'),(
        'ICC Tri-Series (in South Africa)'),(
        'England tour of New Zealand'),(
        'Pakistan v West Indies T20I Series'),(
        'Pakistan in New Zealand ODI Series'),(
        'England Women tour of Malaysia'),(
        'West Indies Women tour of South Africa'),(
        'TVS Cup (India)'),(
        'ICC World Cup Qualifiers'),(
        'Asian Games Men''s Cricket Competition'),(
        'New Zealand tour of Australia'),(
        'Afghanistan tour of United Arab Emirates'),(
        'South Africa Women in Sri Lanka T20I Series'),(
        'Pakistan in Sri Lanka T20I Series'),(
        'Zimbabwe in Scotland ODI Series'),(
        'Zimbabwe Twenty20 Tri-Series'),(
        'South Africa Women in West Indies T20I Series'),(
        'Big Bash League'),(
        'Afghanistan v Ireland ODI Series'),(
        'Bangladesh in Zimbabwe Test Series'),(
        'South Africa tour of Sri Lanka'),(
        'Bangladesh tour of Zimbabwe'),(
        'England in Bangladesh ODI Series'),(
        'Pakistan in Bangladesh ODI Series'),(
        'Hong Kong v Nepal T20I Series'),(
        'Malaysia Tri-Nation T20I Series'),(
        'Kenya in South Africa ODI Series'),(
        'Freedom Trophy'),(
        'New Zealand Cricket Women''s Twenty20'),(
        'India Women in England ODI Series'),(
        'ICC Women''s T20 Qualifier'),(
        'New Zealand in Bangladesh ODI Series'),(
        'South Africa in Australia Test Series'),(
        'India Women tour of West Indies'),(
        'Ireland tour of West Indies'),(
        'West Indies tour of England'),(
        'Afghanistan tour of Zimbabwe'),(
        'Isle of Man tour of Guernsey'),(
        'Commonwealth Games Women''s Cricket Competition Qualifiers'),(
        'United Arab Emirates tour of Nepal'),(
        'Charlotte Edwards Cup'),(
        'Pakistan v West Indies Test Series'),(
        'Quadrangular Twenty20 Series (Hong Kong)'),(
        'Canada in Kenya ODI Series'),(
        'Namibia v Papua New Guinea T20I Match'),(
        'RSA Challenge'),(
        'Zimbabwe tour of Ireland and Scotland'),(
        'Sri Lanka in South Africa Test Series'),(
        'South Africa Women''s T20I Tri-Series'),(
        'Bangladesh Women tour of Malaysia'),(
        'ICC Men''s T20 World Cup Africa Region Qualifier'),(
        'Australia Women in Ireland T20I Series'),(
        'New Zealand Women tour of United Arab Emirates'),(
        'Uganda Women tour of Nepal'),(
        'Sri Lanka in New Zealand Test Series'),(
        'England Women tour of West Indies'),(
        'ICC World Cricket League Division One'),(
        'Australia tour of Pakistan'),(
        'Pakistan tour of Bangladesh'),(
        'ICC World Cricket League Division Six'),(
        'South Africa tour of Ireland'),(
        'England Women tour of India'),(
        'Women''s T20 Quadrangular Series (in Namibia)'),(
        'New Zealand v Sri Lanka T20I Series'),(
        'The Hundred Men''s Competition'),(
        'Afghanistan v Ireland T20I Series'),(
        'Australia in South Africa T20I Series'),(
        'Bangladesh tour of West Indies'),(
        'NatWest Series'),(
        'Scotland in Hong Kong T20I Series'),(
        'Women''s Asia Cup'),(
        'Videocon Cup'),(
        'Desert T20 Challenge'),(
        'Australia v Pakistan ODI Series'),(
        'Afghanistan in Zimbabwe ODI Series'),(
        'West Indies Women in Australia T20I Series'),(
        'Vitality Blast'),(
        'India in South Africa Test Series'),(
        'Ireland v Zimbabwe'),(
        'Sri Lanka in England ODI Series'),(
        'West Indies tour of New Zealand'),(
        'Zimbabwe tour of Pakistan'),(
        'India in West Indies Test Series'),(
        'Ireland Tri-Nation Women''s T20I Series'),(
        'South Africa Women tour of England'),(
        'Pakistan in England ODI Series'),(
        'Netherlands tour of Zimbabwe'),(
        'ICC Men''s Cricket World Cup Super League'),(
        'New Zealand tour of England'),(
        'West Indies Women in England T20I Series'),(
        'South Africa Women in New Zealand ODI Series'),(
        'New Zealand in England T20I Series'),(
        'Ireland Women tour of Netherlands'),(
        'Bob Willis Trophy'),(
        'Bangladesh Women tour of Pakistan'),(
        'West Indies Tri-Nation Series'),(
        'Ireland in Zimbabwe ODI Series'),(
        'Pakistan in West Indies ODI Series'),(
        'Sri Lanka tour of Bangladesh'),(
        'Stan Nagaiah Trophy'),(
        'South Africa in Australia ODI Series'),(
        'Bangladesh tour of South Africa'),(
        'England in West Indies ODI Series'),(
        'Videocon Triangular Series'),(
        'Specsavers County Championship'),(
        'Cricket Ireland Inter-Provincial Twenty20 Trophy'),(
        'England Women in South Africa T20I Series'),(
        'Australia tour of New Zealand'),(
        'Afghanistan in United Arab Emirates T20I Series'),(
        'Pakistan tour of New Zealand'),(
        'Pakistan v South Africa ODI Series'),(
        'New Zealand in England ODI Series'),(
        'Afghanistan v Zimbabwe ODI Series'),(
        'Sobers/Tissera Trophy'),(
        'ICC Women''s T20 World Cup Americas Region Qualifier'),(
        'Sri Lanka tour of Australia'),(
        'Sri Lanka in India ODI Series'),(
        'Scotland Women tour of Ireland'),(
        'Pakistan in Ireland ODI Series'),(
        'Australia in England ODI Series'),(
        'Cricket Ireland Inter-Provincial Limited Over Cup'),(
        'Pakistan in Scotland ODI Series'),(
        'ICC Women''s Championship'),(
        'Australia tour of England'),(
        'Sri Lanka Women tour of West Indies'),(
        'Pakistan vs West Indies ODI Series'),(
        'Sri Lanka in South Africa T20I Series'),(
        'Pakistan in New Zealand T20I Series'),(
        'West Indies Women tour of England'),(
        'New Zealand Women in Australia T20I Series'),(
        'West Indies in New Zealand Test Series'),(
        'Australia tour of West Indies'),(
        'Caribbean Premier League'),(
        'Sri Lanka in West Indies Test Series'),(
        'South Africa Women tour of Ireland'),(
        'New Zealand in Sri Lanka ODI Series'),(
        'West Indies in New Zealand ODI Series'),(
        'Nepal tour of United Arab Emirates'),(
        'India in Sri Lanka ODI Series'),(
        'ICC World Twenty20 Americas Sub Regional Qualifier A'),(
        'Rose Bowl'),(
        'Lanka Premier League'),(
        'South Africa tour of England and Ireland'),(
        'Ireland in United Arab Emirates ODI Series'),(
        'Sri Lanka v Bangladesh'),(
        'Bangladesh in Ireland T20I Series'),(
        'New Zealand in Sri Lanka Test Series'),(
        'ICC World Twenty20 Europe Region Qualifier A'),(
        'Balkan Cup'),(
        'Scotland in Ireland T20I Series'),(
        'South Africa in Sri Lanka ODI Series'),(
        'Bangladesh Women tour of Sri Lanka'),(
        'Sri Lanka in Zimbabwe ODI Series'),(
        'Cherry Blossom Sharjah Cup'),(
        'Australia in West Indies ODI Series'),(
        'Bangladesh in Zimbabwe ODI Series'),(
        'ICC Women''s T20 World Cup Asia Region Qualifier'),(
        'ICC World Twenty20 East Asia-Pacific Region Final'),(
        'Pakistan tour of United Arab Emirates'),(
        'ICC Women''s World Cup Qualifying Series Europe Region'),(
        'Pakistan v Australia T20I Series'),(
        'New Zealand Women tour of Australia'),(
        'Ireland Women tour of Scotland'),(
        'Pakistan in Zimbabwe ODI Series'),(
        'Luxembourg Twenty20 Tri-Series'),(
        'Pakistan Women tour of Sri Lanka'),(
        'Zimbabwe in New Zealand ODI Series'),(
        'England tour of Pakistan'),(
        'England tour of Ireland'),(
        'Sri Lanka Women in South Africa T20I Series'),(
        'Sri Lanka in Bangladesh Test Series'),(
        'Zimbabwe in South Africa T20I Series'),(
        'West Indies tour of South Africa'),(
        'West Indies Women tour of England and Ireland'),(
        'New Zealand T20I Tri-Series'),(
        'Women''s East Asia Cup'),(
        'England in New Zealand Test Series'),(
        'Sri Lanka tour of South Africa'),(
        'ICC Men\u00e2\u20ac\u2122s T20 World Cup Qualifier A'),(
        'Twenty20 Quadrangular (in Namibia)'),(
        'HRV Twenty20'),(
        'England in New Zealand ODI Series'),(
        'Women''s Super Smash'),(
        'New Zealand in India ODI Series'),(
        'Australia in Sri Lanka ODI Series'),(
        'Pakistan in West Indies T20I Series'),(
        'Pakistan Women in Ireland ODI Series'),(
        'Papua New Guinea tour of Singapore'),(
        'The Hundred Women''s Competition'),(
        'Women''s Premier League'),(
        'ICC World Cricket League East Asia-Pacific Region Qualifiers'),(
        'New Zealand in Zimbabwe ODI Series'),(
        'Tri-Nation T20 Cup (Rwanda)'),(
        'Women''s Big Bash League'),(
        'Kenya in Ireland ODI Series'),(
        'Germany tour of Netherlands'),(
        'England in India ODI Series'),(
        'New Zealand tour of Netherlands'),(
        'ICC World Twenty20 Europe Region Qualifier B'),(
        'Sri Lanka in Pakistan Test Series'),(
        'ICC World Cricket League Americas Region Division One'),(
        'Australia in Sri Lanka T20I Series'),(
        'Pakistan tour of England and Scotland'),(
        'Nepal in Netherlands T20I Series'),(
        'West Indies tour of Zimbabwe and South Africa'),(
        'Sri Lanka in Bangladesh T20I Series'),(
        'Bangladesh in Sri Lanka T20I Series'),(
        'Bangladesh in West Indies Test Series'),(
        'Pakistan Women v South Africa Women T20I Series'),(
        'ICC Men''s T20 World Cup Africa Region Final'),(
        'Papua New Guinea tour of Nepal'),(
        'Sri Lanka in Australia ODI Series'),(
        'Afghanistan v Netherlands'),(
        'Marylebone Cricket Club Tri-Nation T20 Series'),(
        'Bangladesh Women tour of Ireland'),(
        'Zimbabwe Triangular Series'),(
        'South Africa tour of Australia'),(
        'Sri Lanka tour of United Arab Emirates and Pakistan'),(
        'South Africa in Bangladesh T20I Series'),(
        'Afghanistan in Scotland ODI Series'),(
        'Afghanistan tour of Bangladesh'),(
        'ICC World Twenty20 Europe Region Qualifier C'),(
        'West Indies in South Africa T20I Series'),(
        'Zimbabwe in West Indies T20I Series'),(
        'Pataudi Trophy'),(
        'Australia tour of Bangladesh'),(
        'New Zealand in West Indies T20I Series'),(
        'ICC Cricket World Cup'),(
        'Border-Gavaskar Trophy'),(
        'Sri Lanka Women in South Africa ODI Series'),(
        'West Indies Women tour of New Zealand'),(
        'West Indies Women in South Africa ODI Series'),(
        'West Indies in Sri Lanka T20I Series'),(
        'ACC Men''s Premier Cup'),(
        'India Women tour of Australia'),(
        'Afro-Asia Cup'),(
        'Men''s T20 Asia Cup Qualifier'),(
        'New Zealand in Zimbabwe Test Series'),(
        'Sri Lanka in Ireland ODI Series'),(
        'Bangladesh tour of Australia'),(
        'Afghanistan v Pakistan'),(
        'Pakistan in Zimbabwe T20I Series'),(
        'Bank Alfalah Cup'),(
        'Zimbabwe tour of Netherlands and Ireland'),(
        'Asia XI tour of South Africa'),(
        'MCC Spirit of Cricket T20I Series'),(
        'ICC World Cricket League Division Two'),(
        'Zimbabwe Tri-Nation Series'),(
        'Asian Games Women''s Cricket Competition'),(
        'Australia tour of Zimbabwe'),(
        'ICC World Twenty20 Asia Region Qualifier A'),(
        'South Asian Games Women''s Cricket Competition'),(
        'T20 Blaze'),(
        'West Indies v India T20I Series'),(
        'Kenya T20 Quadrangular Series'),(
        'England in India T20I Series'),(
        'Women''s Twenty20 Asia Cup'),(
        'ICC Men''s T20 World Cup Sub Regional Africa Qualifier Group A & B'),(
        'South Africa in West Indies ODI Series'),(
        'England in Australia T20I Series'),(
        'United Arab Emirates tour of Zimbabwe'),(
        'The Wisden Trophy'),(
        'Ireland tour of Sri Lanka'),(
        'DLF Cup'),(
        'India in Australia ODI Series'),(
        'Pakistan tour of Zimbabwe'),(
        'ICC Women''s World Cup Qualifier'),(
        'West Indies in India ODI Series'),(
        'Pakistan v England ODI Series'),(
        'New Zealand in West Indies ODI Series'),(
        'Compaq Cup'),(
        'West Indies Women in South Africa T20I Series'),(
        'South Africa in New Zealand T20I Series'),(
        'Bermuda tour of Argentina'),(
        'Ireland tour of United Arab Emirates'),(
        'Botswana tour of Namibia'),(
        'Ireland in Canada ODI Series'),(
        'Trans-Tasman Twenty20 Trophy'),(
        'Basil D''Oliveira Trophy'),(
        'England Tri-Nation T20 Women''s Series'),(
        'Norway Women tour of Sweden'),(
        'West Indies in India Test Series'),(
        'United Arab Emirates v Afghanistan ODI Series'),(
        'Pakistan in West Indies Test Series'),(
        'ICC Women''s World Twenty20'),(
        'India Women tour of Sri Lanka'),(
        'Pakistan in Bangladesh Test Series'),(
        'Chappell-Hadlee Trophy'),(
        'South Africa Women in Australia ODI Series'),(
        'Hong Kong Women tour of United Arab Emirates'),(
        'Pakistan in Zimbabwe Test Series'),(
        'Royal London One-Day Cup'),(
        'Zimbabwe Women tour of Thailand'),(
        'Zimbabwe in Sri Lanka ODI Series'),(
        'Hong Kong tour of Namibia'),(
        'Pakistan tour of West Indies'),(
        'Bangladesh Women in Zimbabwe ODI Series'),(
        'United States of America tour of United Arab Emirates'),(
        'World T20'),(
        'West Indies in Zimbabwe ODI Series'),(
        'Bangladesh in Australia ODI Series'),(
        'Pakistan in England Test Series'),(
        'India tour of England'),(
        'India in Bangladesh Test Series'),(
        'ICC Women''s T20 World Cup Qualifier'),(
        'England in New Zealand T20I Series'),(
        'ICC World Cricket League Asia Region Division One'),(
        'Twenty20 Quadrangular (in Kenya)'),(
        'Dubai Triangular Series'),(
        'Malaysia tour of Singapore'),(
        'West Indies Women in Sri Lanka T20I Series'),(
        'Sri Lanka tour of England'),(
        'Bangladesh tour of West Indies and United States of America'),(
        'New Zealand in South Africa ODI Series'),(
        'India in Australia T20I Series'),(
        'Trans-Tasman Trophy'),(
        'Central Europe Cup'),(
        'Namibia tour of Zimbabwe'),(
        'ICC Women''s World Twenty20 Qualifying Series Asia Region'),(
        'Estonia tour of Cyprus'),(
        'Quadrangular Series (Ireland)'),(
        'Namibia Women tour of Netherlands'),(
        'New Zealand in Bangladesh Test Series'),(
        'ICC Men''s T20 World Cup Asia Region Final'),(
        'West Indies in Australia T20I Series'),(
        'India tour of Australia'),(
        'CG United Women''s Super50'),(
        'Namibia v Scotland T20I Match'),(
        'England tour of Australia and New Zealand'),(
        'Sri Lanka Triangular Series'),(
        'Sheffield Shield');
END

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT ERROR_MESSAGE();
END CATCH;