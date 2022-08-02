SET @R1=0, @R2=0, @R3=0, @R4=0;
SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor)
FROM(
  SELECT CASE WHEN Occupation = 'Doctor' THEN (@R1:=@R1+1)
            WHEN Occupation = 'Professor' THEN (@R2:=@R2+1)
            WHEN Occupation = 'Singer' THEN (@R3:=@R3+1)
            WHEN Occupation = 'Actor' THEN (@R4:=@R4+1) 
    END 
    AS RowNumber,
    CASE WHEN Occupation = 'Doctor' THEN Name END AS Doctor,
    CASE WHEN Occupation='Professor' THEN Name END AS Professor,
    CASE WHEN Occupation='Singer' THEN Name END AS Singer,
    CASE WHEN Occupation='Actor' then Name END AS Actor
  FROM OCCUPATIONS
  ORDER BY Name
    ) temp
GROUP BY RowNumber;