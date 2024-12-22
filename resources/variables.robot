*** Variables ***
# Database Connection Variables
${DB_NAME}         jeux_video
${DB_USER}         root
${DB_PASSWORD}     your_root_password
${DB_HOST}         127.0.0.1
${DB_PORT}         3306

# Test Data Variables
${PRICE_THRESHOLD}    15
${HIGH_PRICE_THRESHOLD}    50

# Query Templates
${QUERY_GAMES_ABOVE_PRICE}    SELECT * FROM jeux_video WHERE prix > %s ORDER BY prix
${QUERY_EXPENSIVE_GAMES}      SELECT nom FROM jeux_video WHERE prix > ${HIGH_PRICE_THRESHOLD}
${QUERY_MAX_PRICE}           SELECT MAX(prix) as max_price FROM jeux_video
${QUERY_MIN_PRICE_ABOVE}     SELECT MIN(prix) as min_price FROM jeux_video WHERE prix > %s

# Message Templates
${MSG_NO_GAMES_FOUND}        No games found with price greater than %s€
${MSG_SEPARATOR}             \n================================ 