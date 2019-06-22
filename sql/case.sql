-- 数値を分類する
SELECT CASE WHEN num < 100 THEN '01'
            WHEN num >= 100 AND num < 200 THEN '02'
            ELSE NULL END AS pop_class,
       COUNT(*) AS cnt
  FROM PopTbl
 GROUP BY CASE WHEN num < 100 THEN '01'
               WHEN num >= 100 AND num < 200 THEN '02'
               ELSE NULL END;
-- pop_class cnt
-- ----- ---
-- 01 1
-- 02 3

-- 数値を分類する MySQL,PostgreSQLの場合、SELECT句の別名が使える
SELECT CASE WHEN num < 100 THEN '01'
            WHEN num >= 100 AND num < 200 THEN '02'
            ELSE NULL END AS pop_class,
       COUNT(*) AS cnt
  FROM PopTbl
 GROUP BY pop_class;
               
               
               
              

               
               
               
