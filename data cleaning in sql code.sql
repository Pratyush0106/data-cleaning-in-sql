		--data cleaning project with olympic datset
		--this dataset having all the data in form of varchar 




		--select everything from the table  before cleaning 
		select * from athlete_events


		--counting id from the table 
		select count(id) from athlete_events
		select id, count(*) from athlete_events group by id order by id asc
		------------------------------------------------------------------------

		select name,team from athlete_events where team like 'china' group by name,team

		--deleting id because it appearing again and again 

		alter table athlete_events drop column id 



		 --adding id with new and fresh 
		alter table athlete_events add  id int identity (1,1)


		--finding the unique vlaue of column age 


		select distinct(age) from athlete_events
		------------------------------------------------------------------------


		--finding element NA in md]edal column 
		select * from athlete_events where medal like  'n%'
		-------------------------------------------------------------

		 --finding the duplicate value that appear more than one time 


			select name, age,country,count(*) from athlete_events 
			group by name , age , country   having count(*) > 1





		------------------------------------------------------------------------


				select name,age from athlete_events where age = 25 group by name,age
		------------------------------------------------------------------------

			   --finding from column(age) where vlaue conatin NA        
				select age,medal  from athlete_events where age like 'n%' or medal like 'n%'
				---------------------------------------------------


				--deleting from column(age) where value contain NA
				delete  from athlete_events where age like 'n%'
		-------------------------------------------------------------
		--finding younger and adult 
		select name , age, 
		case when age > 18 then 'adult' else 'younger' end as category
		from athlete_events order by age asc





		-- udating the existing value from column (medal) from NA to gold of id "1"
		update athlete_events set medal = 'gold' where id = '1'


			   --finding from column(medal) where vlaue conatin NA  
		select name,(medal) from athlete_events where  medal like 'N%' group by name,medal
    

			------finding age less than 18

		select age  from athlete_events where age <'18'  order by age asc


		 --finding the duplicate value that appear more than one time 
		select name,age,height,country,count(*)
		from athlete_events
		group by name,age,height,age,country
		having name > '1' and age >1 and height > ' 1'and country > '1'.



				--deleting from column(height ) where value contain NA
		delete from athlete_events where height = 'N%'




		----------deleting duplicate value  from table using cte  

		with duplicate_cte as (
		select id,name,age,sex,height,country, Row_number() over (partition by id,name,age,sex,height,country 
		order by id ) as dupcount from athlete_events )

		delete duplicate_cte where dupcount > 1



				--deleting from weight (age) where value contain NA

		delete from athlete_events  where Weight like 'N%' 







		--deleting from column(medal) where value contain NA
		delete from athlete_events where Medal like 'N%'


		--finding how many time a name is apeearing but not the other column value 
		select id,name, count(*) from athlete_events group by id,name having count(*) > 1



		--select everything from the table  after  cleaning 
		select * from athlete_events


		--before cleaning  the data containg more than 2lakhs rows now it's clean and contain less rows
		select count(id) from athlete_events