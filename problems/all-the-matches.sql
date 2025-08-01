--* 2339. All the Matches of the League *--

-- Table: Teams

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | team_name   | varchar |
-- +-------------+---------+
-- team_name is the column with unique values of this table.
-- Each row of this table shows the name of a team.


-- Write a solution to report all the possible matches of the league. Note that every two teams play two matches with each other, with one team being the home_team once and the other time being the away_team.


--* Solution *--
SELECT home.team_name AS home_team,away.team_name AS away_team
FROM Teams AS home
JOIN Teams AS away ON home.team_name <> away.team_name;
