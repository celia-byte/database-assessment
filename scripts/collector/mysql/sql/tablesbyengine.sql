SELECT /*+ MAX_EXECUTION_TIME(5000) */ ENGINE AS Storage_Engine,
                       COUNT(*) Tables_Count,
                       ROUND(SUM(data_length) / (1024*1024*1024), 2) Data_Size,
                       ROUND(SUM(index_length)/ (1024*1024*1024), 2) Index_Size
                                , concat(char(39), @DMASOURCEID, char(39)) as DMA_SOURCE_ID, concat(char(39), @DMAMANUALID, char(39)) as DMA_MANUAL_ID
FROM information_schema.TABLES
WHERE ENGINE IS NOT NULL
  AND table_schema NOT IN ('mysql',
                           'information_schema',
                           'performance_schema',
                           'sys')
GROUP BY ENGINE
;