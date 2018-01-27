select
   contests.`contest_id`,
   contests.`hacker_id`,
   contests.`name`,
   contest_stats.`contest_total_submissions`,
   contest_stats.`contest_total_accepted_submissions`,
   contest_stats.`contest_total_views`,
   contest_stats.`contest_total_unique_views`
from
   contests
   inner join
      (
         select
            colleges.`contest_id`,
            ifnull(sum(`challenge_total_submissions`), 0) as `contest_total_submissions`,
            ifnull(sum(`challenge_total_accepted_submissions`), 0) as `contest_total_accepted_submissions`,
            ifnull(sum(`challenge_total_views`), 0) as `contest_total_views`,
            ifnull(sum(`challenge_total_unique_views`), 0) as `contest_total_unique_views`
         from
            colleges
            inner join
               (
                  select
                     challenges.`challenge_id`,
                     challenges.`college_id`,
                     `challenge_total_views`,
                     `challenge_total_unique_views`,
                     `challenge_total_submissions`,
                     `challenge_total_accepted_submissions`
                  from
                     challenges
                     left join
                        (
                           select
                              `challenge_id`,
                              sum(`total_views`) as `challenge_total_views`,
                              sum(`total_unique_views`) as `challenge_total_unique_views`
                           from
                              view_stats
                           group by
                              `challenge_id`
                        )
                        challenge_view_stats
                        on challenges.`challenge_id` = challenge_view_stats.`challenge_id`
                     left join
                        (
                           select
                              `challenge_id`,
                              sum(`total_submissions`) as `challenge_total_submissions`,
                              sum(`total_accepted_submissions`) as `challenge_total_accepted_submissions`
                           from
                              submission_stats
                           group by
                              `challenge_id`
                        )
                        challenge_submission_stats
                        on challenges.`challenge_id` = challenge_submission_stats.`challenge_id`
               )
               as challenge_stats
               on challenge_stats.`college_id` = colleges.`colllege_id`
         group by
            colleges.`contest_id`
      )
      as contest_stats
      on contests.`contest_id` = contest_stats.`contest_id`
where
   `contest_total_submissions` + `contest_total_accepted_submissions` + `contest_total_views` + `contest_total_unique_views` != 0
order by
   contests.`contest_id` asc