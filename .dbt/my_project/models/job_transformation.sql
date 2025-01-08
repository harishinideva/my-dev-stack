-- job_transformation.sql
WITH cleaned_data AS (
    SELECT
        title,
        comp_name,
        main_2,
        expwdth,
        salary,
        location,
        job_desc,
        dot_gt,
        dot_gt_2,
        dot_gt_3
    FROM {{ source('job_dataset', 'job_dataset') }}
),
salary_cleaned AS (
    SELECT
        title,
        comp_name,
        main_2,
        expwdth,
        CASE
            WHEN salary LIKE '%k' THEN CAST(REPLACE(salary, 'k', '') AS FLOAT) * 1000
            WHEN salary LIKE '%m' THEN CAST(REPLACE(salary, 'm', '') AS FLOAT) * 1000000
            ELSE CAST(salary AS FLOAT)
        END AS salary,
        location,
        job_desc,
        dot_gt,
        dot_gt_2,
        dot_gt_3,
        dot_gt_4,
        dot_gt_5,
        dot_gt_6,
        dot_gt_7,
        dot_gt_8
    FROM cleaned_data
)
SELECT
    title,
    comp_name,
    main_2,
    expwdth,
    salary,
    location,
    job_desc,
    dot_gt,
    dot_gt_2,
    dot_gt_3,
    dot_gt_4,
    dot_gt_5,
    dot_gt_6,
    dot_gt_7,
    dot_gt_8
FROM salary_cleaned;
