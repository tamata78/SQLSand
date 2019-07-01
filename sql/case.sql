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

-- 数値を分類する (MySQL,PostgreSQLの場合、SELECT句の別名が使える)
SELECT CASE WHEN num < 100 THEN '01'
            WHEN num >= 100 AND num < 200 THEN '02'
            ELSE NULL END AS pop_class,
       COUNT(*) AS cnt
  FROM PopTbl
 GROUP BY pop_class;
               
-- 異なる条件のSQLを一つにまとめる (CASE文内の条件で２つSQLを発行するところをまとめた)
SELECT pref_name,
    - man
    SUM(CASE WHEN sex = '1' THEN population ELSE 0) AS cut_m,
    - female
    SUM(CASE WHEN sex = '2' THEN population ELSE 0) AS cut_f,
FROM PopTbl
GROUP BY pref_name;

-- 条件条件分岐UPDATE (２つの条件のレコードを一回で更新。片方の更新に影響を受けずにパフォを向上させつつ更新)
UPDATE Personnel
    SET salary = CASE WHEN salary >= 300000 THEN salary * 0.9 
                 WHEN salary >= 250000 AND salary < 280000 THEN salary * 1.2
                 ELSE salary END;

-- CASE式で主キーを入れ替える (一意制約違反を回避しつつ、主キー入れ替え)
UPDATE SomeTable
   SET p_key = CASE WHEN p_key = 'a'
                    THEN 'b'
                    WHEN p_key = 'b'
                    THEN 'a'
               ELSE p_key END
 WHERE p_key IN ('a', 'b');
 
                 

              

               
               
               
