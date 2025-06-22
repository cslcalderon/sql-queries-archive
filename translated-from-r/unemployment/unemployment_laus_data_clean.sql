
    with cleaned_uemp_24 as (
    select 
    rtrim(Area) as Location, 
    Year, 
    (case when "Area Type" = 'Texas' then 'State' 
        else 'County' end) as LocationType, 
    (cast(replace(Unemployment, ',','') as integer)) as 
        Unemployment, 
    ("Unemployment Rate"/100) as "Unemployment Rate"
    from unemployment
    ), 
    withids_2024 as (
        select
        cleaned.*, 
        l.LocationId
        from cleaned_uemp_24 cleaned 
        left join locations l 
        on cleaned.Location = l.Location)
    select 
        LocationId, 
        Location, 
        Year as TimeFrame, 
        LocationType, 
        DataFormat,
        (case 
            when DataFormat = 'Number' then Unemployment
            when DataFormat = 'Percent' then "Unemployment Rate"
        end) as Data
        from withids_2024
        cross join (
            select 'Number' as DataFormat
            union all 
            select 'Percent' as DataFormat) formats 
        order by LocationType desc, Location;
  

    
