/*
Script type: DML
Created by: Ahmad Chuahdry
Created Date: 05/28/2023
Purpose: Inserting data in teams table
*/

USE [IPLVSPSL]

SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;
IF OBJECT_ID('dbo.Teams', 'U') IS NOT NULL
	IF NOT EXISTS (Select * from Teams)
	BEGIN
	INSERT INTO Teams([Name])
	VALUES
	('Abu Dhabi Knight Riders'),(
			'Adelaide Strikers'),(
			'Afghanistan'),(
			'Africa XI'),(
			'Andhra'),(
			'Antigua Hawksbills'),(
			'Argentina'),(
			'Arunachal Pradesh'),(
			'Asia XI'),(
			'Assam'),(
			'Auckland'),(
			'Australia'),(
			'Austria'),(
			'Bahamas'),(
			'Bahrain'),(
			'Balkh Legends'),(
			'Bangladesh'),(
			'Barbados'),(
			'Barbados Royals'),(
			'Barbados Tridents'),(
			'Barisal Bulls'),(
			'Barisal Burners'),(
			'Barmy Army'),(
			'Baroda'),(
			'Belgium'),(
			'Belize'),(
			'Bengal'),(
			'Bermuda'),(
			'Bhutan'),(
			'Bihar'),(
			'Birmingham Bears'),(
			'Birmingham Phoenix'),(
			'Boland'),(
			'Botswana'),(
			'Brazil'),(
			'Brisbane Heat'),(
			'Bulgaria'),(
			'Cambodia'),(
			'Cameroon'),(
			'Canada'),(
			'Canterbury'),(
			'Cape Cobras'),(
			'Cape Town Blitz'),(
			'Cayman Islands'),(
			'Central Districts'),(
			'Central Sparks'),(
			'Chandigarh'),(
			'Chattogram Challengers'),(
			'Chennai Super Kings'),(
			'Chhattisgarh'),(
			'China'),(
			'Chittagong Kings'),(
			'Chittagong Vikings'),(
			'Colombo Kings'),(
			'Colombo Stars'),(
			'Comilla Victorians'),(
			'Cook Islands'),(
			'Croatia'),(
			'Cumilla Warriors'),(
			'Cyprus'),(
			'Czech Republic'),(
			'Dambulla Aura'),(
			'Dambulla Giants'),(
			'Dambulla Viiking'),(
			'Deccan Chargers'),(
			'Delhi'),(
			'Delhi Capitals'),(
			'Delhi Daredevils'),(
			'Denmark'),(
			'Derbyshire'),(
			'Desert Vipers'),(
			'Dhaka Dominators'),(
			'Dhaka Dynamites'),(
			'Dhaka Gladiators'),(
			'Dhaka Platoon'),(
			'Dolphins'),(
			'Dubai Capitals'),(
			'Durban Heat'),(
			'Durban''s Super Giants'),(
			'Durham'),(
			'Duronto Rajshahi'),(
			'England'),(
			'Essex'),(
			'Estonia'),(
			'Eswatini'),(
			'Falcons'),(
			'Fiji'),(
			'Finland'),(
			'Fortune Barishal'),(
			'France'),(
			'Galle Gladiators'),(
			'Gambia'),(
			'Germany'),(
			'Ghana'),(
			'Gibraltar'),(
			'Glamorgan'),(
			'Gloucestershire'),(
			'Goa'),(
			'Greece'),(
			'Guernsey'),(
			'Gujarat'),(
			'Gujarat Giants'),(
			'Gujarat Lions'),(
			'Gujarat Titans'),(
			'Gulf Giants'),(
			'Guyana'),(
			'Guyana Amazon Warriors'),(
			'Hampshire'),(
			'Haryana'),(
			'Himachal'),(
			'Himachal Pradesh'),(
			'Hobart Hurricanes'),(
			'Hong Kong'),(
			'Hungary'),(
			'Hyderabad (India)'),(
			'ICC World XI'),(
			'Impi'),(
			'India'),(
			'Indonesia'),(
			'Iran'),(
			'Ireland'),(
			'Islamabad United'),(
			'Isle of Man'),(
			'Israel'),(
			'Italy'),(
			'Jaffna Kings'),(
			'Jaffna Stallions'),(
			'Jamaica'),(
			'Jamaica Tallawahs'),(
			'Jammu & Kashmir'),(
			'Japan'),(
			'Jersey'),(
			'Jharkhand'),(
			'Joburg Super Kings'),(
			'Jozi Stars'),(
			'Kabul Zwanan'),(
			'Kandahar Knights'),(
			'Kandy Falcons'),(
			'Kandy Tuskers'),(
			'Kandy Warriors'),(
			'Karachi Kings'),(
			'Karnataka'),(
			'Kent'),(
			'Kenya'),(
			'Kerala'),(
			'Khulna Royal Bengals'),(
			'Khulna Tigers'),(
			'Khulna Titans'),(
			'Kings XI Punjab'),(
			'Knights'),(
			'Kochi Tuskers Kerala'),(
			'Kolkata Knight Riders'),(
			'Kuwait'),(
			'Lahore Qalandars'),(
			'Lancashire'),(
			'Lancashire Thunder'),(
			'Leeward Islands'),(
			'Leicestershire'),(
			'Leinster Lightning'),(
			'Lesotho'),(
			'Lightning'),(
			'Lions'),(
			'London Spirit'),(
			'Loughborough Lightning'),(
			'Lucknow Super Giants'),(
			'Luxembourg'),(
			'MI Cape Town'),(
			'MI Emirates'),(
			'Madhya Pradesh'),(
			'Maharashtra'),(
			'Malawi'),(
			'Malaysia'),(
			'Maldives'),(
			'Mali'),(
			'Malta'),(
			'Manchester Originals'),(
			'Manipur'),(
			'Meghalaya'),(
			'Melbourne Renegades'),(
			'Melbourne Stars'),(
			'Middlesex'),(
			'Minister Group Dhaka'),(
			'Mizoram'),(
			'Mozambique'),(
			'Multan Sultans'),(
			'Mumbai'),(
			'Mumbai Indians'),(
			'Munster Reds'),(
			'Myanmar'),(
			'Nagaland'),(
			'Namibia'),(
			'Nangarhar Leopards'),(
			'Nelson Mandela Bay Giants'),(
			'Nepal'),(
			'Netherlands'),(
			'New South Wales'),(
			'New Zealand'),(
			'Nigeria'),(
			'North West'),(
			'North-West Warriors'),(
			'Northamptonshire'),(
			'Northern Diamonds'),(
			'Northern Districts'),(
			'Northern Knights'),(
			'Northern Superchargers'),(
			'Norway'),(
			'Nottinghamshire'),(
			'Odisha'),(
			'Oman'),(
			'Otago'),(
			'Oval Invincibles'),(
			'Paarl Rocks'),(
			'Paarl Royals'),(
			'Pakistan'),(
			'Paktia Panthers'),(
			'Panama'),(
			'Papua New Guinea'),(
			'Perth Scorchers'),(
			'Peshawar Zalmi'),(
			'Philippines'),(
			'Portugal'),(
			'Pretoria Capitals'),(
			'Puducherry'),(
			'Pune Warriors'),(
			'Punjab'),(
			'Punjab Kings'),(
			'Qatar'),(
			'Queensland'),(
			'Quetta Gladiators'),(
			'Railways'),(
			'Rajasthan'),(
			'Rajasthan Royals'),(
			'Rajshahi Kings'),(
			'Rajshahi Royals'),(
			'Rangpur Rangers'),(
			'Rangpur Riders'),(
			'Rising Pune Supergiant'),(
			'Rising Pune Supergiants'),(
			'Romania'),(
			'Royal Challengers Bangalore'),(
			'Rwanda'),(
			'Samoa'),(
			'Sapphires'),(
			'Saudi Arabia'),(
			'Saurashtra'),(
			'Scotland'),(
			'Serbia'),(
			'Services'),(
			'Seychelles'),(
			'Sharjah Warriors'),(
			'Sierra Leone'),(
			'Sikkim'),(
			'Singapore'),(
			'Slovenia'),(
			'Somerset'),(
			'South Africa'),(
			'South Australia'),(
			'South East Stars'),(
			'South Korea'),(
			'Southern Brave'),(
			'Southern Vipers'),(
			'Spain'),(
			'Spirit'),(
			'Sri Lanka'),(
			'St Helena'),(
			'St Kitts and Nevis Patriots'),(
			'St Lucia Kings'),(
			'St Lucia Stars'),(
			'St Lucia Zouks'),(
			'Sunrisers'),(
			'Sunrisers Eastern Cape'),(
			'Sunrisers Hyderabad'),(
			'Supernovas'),(
			'Suriname'),(
			'Surrey'),(
			'Surrey Stars'),(
			'Sussex'),(
			'Swaziland'),(
			'Sweden'),(
			'Switzerland'),(
			'Sydney Sixers'),(
			'Sydney Thunder'),(
			'Sylhet Royals'),(
			'Sylhet Sixers'),(
			'Sylhet Strikers'),(
			'Sylhet Sunrisers'),(
			'Sylhet Super Stars'),(
			'Sylhet Thunder'),(
			'Tamil Nadu'),(
			'Tanzania'),(
			'Tasmania'),(
			'Thailand'),(
			'The Blaze'),(
			'Thunder'),(
			'Titans'),(
			'Tornadoes'),(
			'Trailblazers'),(
			'Trent Rockets'),(
			'Trinbago Knight Riders'),(
			'Trinidad & Tobago Red Steel'),(
			'Trinidad and Tobago'),(
			'Tripura'),(
			'Tshwane Spartans'),(
			'Turkey'),(
			'UP Warriorz'),(
			'Uganda'),(
			'United Arab Emirates'),(
			'United States of America'),(
			'Uttar Pradesh'),(
			'Uttarakhand'),(
			'Vanuatu'),(
			'Velocity'),(
			'Victoria'),(
			'Vidarbha'),(
			'Warriors'),(
			'Warriors (FairBreak)'),(
			'Warwickshire'),(
			'Wellington'),(
			'Welsh Fire'),(
			'West Indies'),(
			'Western Australia'),(
			'Western Province'),(
			'Western Storm'),(
			'Windward Islands'),(
			'Worcestershire'),(
			'Yorkshire'),(
			'Yorkshire Diamonds'),(
			'Zambia'),(
			'Zimbabwe');
	END;

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT ERROR_MESSAGE();
END CATCH;