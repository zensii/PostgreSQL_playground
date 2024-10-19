SELECT
    tablename,
    indexname,
    indexdef
from pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename;