#if day divisible by 7, it is a Sunday

def find_20th_century_sundays
    day=0
    year=1900
    sundays=0
    while year <= 2000
        day+=31 #january
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        if year % 4 == 0 && year % 400 == 0
            day+=29
        elsif year % 4 == 0 && year % 100 == 0
            day+=28
        elsif year % 4 == 0
            day+=29
        else
            day+=28
        end
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        day+=31 #march
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        day+=30 #april
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        day+=31 #may
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        day+=30 #june
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        day+=31 #july
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        day+=31 #august
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        day+=30 #september
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        day+=31 #october
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        day+=30 #november
        sundays+=1 if (day+1) % 7 == 0 unless year == 1900
        day+=31 #december
        sundays+=1 if (day+1) % 7 == 0 unless year == 2000
        year += 1
    end
    sundays
end

p find_20th_century_sundays
