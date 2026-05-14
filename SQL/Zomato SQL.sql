use excelr;
select * from Zomato;
select * from country_code;

-- 1. Build a country Map Table

select distinct Z.countrycode,C.Country from Zomato Z
inner join country_code C
on Z.countrycode=C.countryCode
order by Z.countrycode asc;

   select * from Zomato;
   
   --  A.Year
   select distinct datekey_opening, substring_index(Datekey_Opening,'-',-1) as year from Zomato;
   
   --   B.Monthno
   select distinct datekey_opening, substring_index(substring_index(datekey_opening,"-",2),"-",-1) as month from Zomato;
   
   --  C.Monthfullname
   select distinct datekey_opening, monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y")) as Month_Name from Zomato;
   
   -- Day
   select distinct datekey_opening, substring_index(Datekey_Opening,'-',1) as year from Zomato;
   
   --  D.Quarter(Q1,Q2,Q3,Q4)
   select distinct datekey_opening, concat("Q",quarter(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))) as Quarter from Zomato;
   
   --  E. YearMonth ( YYYY-MMM)
   select distinct datekey_opening, concat (substring_index(Datekey_Opening,'-',-1), "-",substring_index(substring_index(datekey_opening,"-",2),"-",-1)) as Yearmonth from Zomato;
   
   -- F. Weekdayno
   select distinct datekey_opening, weekday(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y")) as Weekdayno from Zomato;
   
   -- G.Weekdayname
   select distinct datekey_opening, dayname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y")) as Weekdayname from Zomato;
   
   -- H.FinancialMOnth ( April = FM1, May= FM2  …. March = FM12)
   
   select distinct datekey_opening, monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y")) as month_name,
   (case when  monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="April" then "FM1"
   when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="May" then "FM2"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="June" then "FM3"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="July" then "FM4"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="August" then "FM5"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="September" then "FM6"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="October" then "FM7"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="November" then "FM8"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="December" then "FM9"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="January" then "FM10"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="February" then "FM11"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))="March" then "FM12"
   end) as Finanacial_Month
   from Zomato;
   
   -- I. Financial Quarter
   select distinct datekey_opening, monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y")) as month_name,
   (case when  monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y")) in ("April","May","June") then "Q1"
   when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y")) in ("July","August","September") then "Q2"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y")) in ("October","November","December") then "Q3"
    when monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y")) in ("January","February","March") then "Q4"
   end) as Finanacial_Quarter
   from Zomato;
   
   -- 3.Find the Numbers of Resturants based on City and Country.
   select count(*), Z.City, C.Country
   from Zomato Z inner join country_code C 
   where Z.countrycode=C.countrycode
   group by City,Country;
   
   -- 4.Numbers of Resturants opening based on Year , Quarter , Month
   select count(*),substring_index(Datekey_Opening,'-',-1) as year,concat("Q",quarter(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y"))) as Quarter,monthname(str_to_date(concat(substring_index(datekey_opening,"-",1),"-",
   substring_index(substring_index(datekey_opening,"-",2),"-",-1),"-",substring_index(datekey_opening,"-",-1)),"%d-%m-%y")) as Month_Name
   from Zomato
   group by year, Quarter,Month_Name
   order by year asc;
   
   -- 5. Count of Resturants based on Average Ratings
   
     SELECT avg_rating, COUNT(*) AS restaurant_count
     FROM (SELECT restaurantid, ROUND(AVG(rating), 1) AS avg_rating
    FROM Zomato
    GROUP BY restaurantid) AS avg_table
GROUP BY avg_rating
having avg_rating=2.9;

 -- 6. Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets
     select count(*) as Resturant_Count, 
     (case when Average_Cost_for_two<=200 then "0-200"
     when Average_Cost_for_two between 201 and 400 then "201-400"
	 when Average_Cost_for_two between 401 and 600 then "401-600"
     when Average_Cost_for_two between 601 and 800 then "601-800"
     else "800 and Above"
     end) as Price_Bucket
     from Zomato
     group by Price_Bucket
     order by Price_Bucket asc;
     
     -- 7.Percentage of Resturants based on "Has_Table_booking".
     select * from zomato;
     
     select Has_Table_booking, count(*) as Resturant_Count,
     round((count(*) / (select count(*) from Zomato)*100),2) as percentage 
     from Zomato
     group by  Has_Table_booking;
     
     -- 8.Percentage of Resturants based on "Has_Online_delivery".
      select Has_Online_delivery, count(*) as Resturant_Count,
     round((count(*) / (select count(*) from Zomato)*100),2) as percentage 
     from Zomato
     group by  Has_Online_delivery;
     
     
     
   
   












 














 
