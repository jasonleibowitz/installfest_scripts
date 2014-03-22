export STUDENTS="$HOME/dev/wdi/WDI_Reduce"

function day_of_week_number {
    day_of_week=$(date "+%A")
    case $day_of_week in
        "Monday")    num='01';;
        "Tuesday")   num='02';;
        "Wednesday") num='03';;
        "Thursday")  num='04';;
        "Friday")    num='05';;
        *)           num='00';;
    esac

    echo $num;
}

function week_of_course {
    COURSE_START_DATE="022400002014"
    COURSE_START_SECONDS=$(date -j $COURSE_START_DATE "+%s")
    TODAY_SECONDS=$(date "+%s")
    DIFF_SECONDS=$(($TODAY_SECONDS - $COURSE_START_SECONDS))
    DIFF_DAYS=$(($DIFF_SECONDS / 60 / 60 / 24))
    DAYS_PER_WEEK=7
    # use an arithmetic trick to round up when we divide to get the week count
    DIFF_DAYS_ROUNDED=$(($DIFF_DAYS + ($DAYS_PER_WEEK - 1)))
    WEEK_OF_COURSE=$(($DIFF_DAYS_ROUNDED / $DAYS_PER_WEEK))

    if [ "$WEEK_OF_COURSE" -lt "10" ]; then
        echo -n "0"
    fi

    echo $WEEK_OF_COURSE
}

export WDI_DAY=$( echo $STUDENTS/w$(week_of_course)/d$(day_of_week_number) )

function today {
    cd $WDI_DAY
}
