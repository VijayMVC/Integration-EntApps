CREATE PROCEDURE [dbo].[usp_FluWatchLoad] AS
/*Stored Procedure created to calculate Flu Watch Averages and clean up data
for load to Website
Author:  Antonia Miller*/
INSERT INTO FluWeekAll
(PercentFlu, YearRange)
Select avg(percentflu), 'Prev 3 Season Avg' FROM FluWeekAll
where yearrange in('2002-2003', '2003-2004', '2004-2005')

INSERT INTO FluWeekRegion
(RegionDescr, PercentFlu, YearRange)
Select 'Central California', avg(percentflu), 'Prev 3 Season Avg' FROM FluWeekRegion
where yearrange in('2002-2003', '2003-2004', '2004-2005')
AND RegionDescr = 'Central California'

INSERT INTO FluWeekRegion
(RegionDescr, PercentFlu, YearRange)
Select 'Northern California', avg(percentflu), 'Prev 3 Season Avg' FROM FluWeekRegion
where yearrange in('2002-2003', '2003-2004', '2004-2005')
AND RegionDescr = 'Northern California'

INSERT INTO FluWeekRegion
(RegionDescr, PercentFlu, YearRange)
Select 'Southern California', avg(percentflu), 'Prev 3 Season Avg' FROM FluWeekRegion
where yearrange in('2002-2003', '2003-2004', '2004-2005')
AND RegionDescr = 'Southern California'

INSERT INTO FluWeekRegion
(RegionDescr, PercentFlu, YearRange)
Select 'Georgia', avg(percentflu), 'Prev 3 Season Avg' FROM FluWeekRegion
where yearrange in('2002-2003', '2003-2004', '2004-2005')
AND RegionDescr = 'Georgia'

UPDATE FluWeekRegion
SET RegionDescr = RTrim(RegionDescr)

UPDATE FluAgeAll
SET AgeGroup = LTrim(AgeGroup)

UPDATE FluAgeRegion
SET AgeGroup =  LTrim(AgeGroup), RegionDescr = RTrim(RegionDescr)

UPDATE FluAdmitsRegion
SET RegionDescr = RTrim(RegionDescr)

DELETE FROM FluAgeAll WHERE YearRange IS NULL
DELETE FROM FluAgeRegion WHERE YearRange IS NULL
