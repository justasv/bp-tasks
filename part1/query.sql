set @row = 0, @row2 = 0;

select `x2`, `y2`
from
(select @row:=@row + 1 as `row_number1`, x as `x1`, y as `y1` from symmetric_pairs order by `x1` asc) symmetric_pairs1
left join 
(select @row2:=@row2 + 1 as `row_number2`, x as `x2`, y as `y2` from symmetric_pairs order by `x2` asc) symmetric_pairs2 on symmetric_pairs1.`row_number1` = symmetric_pairs2.`row_number2` + 1
where symmetric_pairs1.`x1` = symmetric_pairs2.`y2` and symmetric_pairs1.`y1` = symmetric_pairs2.`x2`
order by `x2`