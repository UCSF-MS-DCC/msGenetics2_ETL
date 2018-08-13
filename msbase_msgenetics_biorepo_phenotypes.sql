select
ri.subjectid,
case when si.subjectid is null then "N" else "Y" end as iMSMS,

ri.gender as sex,
ri.diseasecourse as disease_course,
ri.disease as disease,
ri.aoo as age_onset,
ri.dna,
ri.serum,
ri.plasma,
sq.phenotypedatasource as phenotype_datasource,
case when sq.caucasian = 1 and sq.aa + sq.asian + sq.native + sq.hispanic = 0 then 'european'
	when sq.aa = 1 and sq.caucasian + sq.asian + sq.native + sq.hispanic = 0 then 'african american'
	when sq.asian = 1 and sq.caucasian + sq.aa + sq.native + sq.hispanic = 0 then 'asian'
	when sq.native = 1 and sq.caucasian + sq.aa + sq.asian + sq.hispanic = 0 then 'native american'
	when sq.hispanic = 1 and sq.caucasian + sq.aa + sq.asian + sq.native then 'hispanic' 
	when sq.caucasian + sq.aa + sq.asian + sq.native > 1 then 'multirace'
	else 'unknown' end as race
from
msgenlabprod._repository_inventory ri
join
subjects._querytable sq
on
ri.subjectid = sq.subjectid
and ri.disease not like "Not MS - Other ND%" and ri.disease != "Not MS"
and ri.center_id != "01" and ri.center_id != "08" and ri.center_id != "12" and ri.center_id != "14" and ri.center_id != "18" and ri.center_id != "30" and ri.center_id != "49" and ri.center_id != "50" and ri.center_id != "63" and ri.center_id != "64"
and ri.center_id != "68" and ri.center_id != "77" and ri.center_id != "84" and ri.center_id != "85" and ri.center_id != "86" and ri.center_id != "92" and ri.center_id != "93" and ri.center_id != "94" and ri.center_id != "131"
and ri.center_id != "152" and ri.center_id != "153" and ri.center_id != "9961" and ri.center_id != "9963" and ri.center_id != "9964" and ri.center_id != "9965" and ri.center_id != "9966"
and ri.center_id != "Coriell" and ri.center_id != "Edinburgh" and ri.center_id != "FLENI" and ri.center_id != "HapMap" and ri.center_id != "NMDP" and ri.center_id != "Non-Human" and ri.center_id != "Purchased" and ri.center_id != "SIN"
left join
imsms.subject_imsms si
on
ri.subjectid = si.subjectid
