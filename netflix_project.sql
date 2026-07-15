-- STEP 1: Create a staging table matching the FULL CSV structure (including ML encoding columns)
CREATE TABLE staging_netflix (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title VARCHAR(255),
    director VARCHAR(255),
    cast_members TEXT,
    country TEXT,
    date_added DATE,
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(20),
    listed_in TEXT,
    description TEXT,
    year_added INT,
    month_added VARCHAR(20),
    duration_value INT,
    duration_unit VARCHAR(20),
    primary_country VARCHAR(100),
    primary_genre VARCHAR(100),
    genre_count INT,
    years_to_add INT,
    country_enc INT,
    genre_enc INT,
    rating_enc INT,
    type_enc INT,
    cluster INT
);

SELECT COUNT(*) FROM staging_netflix;   -- Should return 8797

-- Recreate netflix_titles table using only the required columns from staging
CREATE TABLE netflix_titles AS
SELECT
    show_id,
    type,
    title,
    director,
    cast_members,
    country,
    date_added,
    release_year,
    rating,
    duration,
    listed_in,
    description,
    year_added,
    month_added,
    duration_value,
    duration_unit,
    primary_country,
    primary_genre,
    genre_count,
    years_to_add,
    cluster
FROM staging_netflix;

-- Add the primary key back
ALTER TABLE netflix_titles ADD PRIMARY KEY (show_id);

-- Verify row count
SELECT COUNT(*) FROM netflix_titles;   -- Should return 8797

SELECT COUNT(*) FROM netflix_titles;   -- Confirm data is there (8797)

DROP TABLE staging_netflix;

-- Table for cluster summary insights (from Colab ML step)
CREATE TABLE cluster_profile (
    cluster INT PRIMARY KEY,
    duration_value NUMERIC,
    genre_count NUMERIC,
    years_to_add NUMERIC,
    release_year NUMERIC,
    count INT,
    top_genre VARCHAR(100),
    top_country VARCHAR(100),
    dominant_type VARCHAR(20)
);

-- Table for feature importance insights (from Colab ML step)
CREATE TABLE feature_importance (
    feature_name VARCHAR(50) PRIMARY KEY,
    importance NUMERIC
);

SELECT * FROM cluster_profile;
SELECT * FROM feature_importance;

SELECT COUNT(*) FROM cluster_profile;
SELECT COUNT(*) FROM feature_importance;

SELECT COUNT(*) FROM cluster_profile;