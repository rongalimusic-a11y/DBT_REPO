WITH BIKE AS (
    SELECT 
        RIDE_ID,
		to_timestamp(STARTED_AT, 'YYYY-MM-DD HH24:MI:SS.FF4') AS STARTED_AT,
		try_to_timestamp(ENDED_AT, 'YYYY-MM-DD HH24:MI:SS.FF4') as ENDED_AT,
		START_STATION_NAME,
		START_STATIO_ID,
		END_STATION_NAME,
		END_STATION_ID,
		START_LAT,
		START_LNG,
		END_LAT,
		END_LNG,
		MEMBER_CSUAL
    FROM {{ source('demo', 'bike') }}
    where RIDE_ID != '"bikeid"' 
        AND try_to_timestamp(STARTED_AT, 'YYYY-MM-DD HH24:MI:SS.FF4') IS NOT null
        AND try_to_timestamp(ENDED_AT, 'YYYY-MM-DD HH24:MI:SS.FF4') IS NOT NULL
)

SELECT 
*
FROM BIKE