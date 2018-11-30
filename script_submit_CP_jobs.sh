#!bin/bash/

# set range of parameters for z*, r*, th' (3 values per index)

# loop through range:
# - generate namelist file (to get new uuid)
# - change parameters in namelist file
# - (change dimensions and output frequencies in namelist file)
# - submit job

# (try with multiple cores)

dTh=2
th_params=( 2 3 )
z_params=( 500 1000 )
r_params=( 2000 1000 )

n_geom=${#z_params[@]}
n_therm=${#th_params[@]}
n_tot=$(( $n_geom*$n_therm ))
###n_tot=$(( 5*5 ))

echo $n_geom
echo $n_therm
echo $n_tot

count_geom=0
while [ $count_geom -lt $n_geom ]
do 
  echo $count_geom
  # 'echo $z_params' will output only the first element.
  zstar=${z_params[$count_geom]}
  rstar=${r_params[$count_geom]}
  echo "parameters",$zstar $rstar
  python test_generate_namelist.py ColdPoolDry_single_3D --zstar $zstar --rstar $zstar --dTh $dTh 

  #sbatch SLURM_script_bm.sh ColdPoolDry_single_3D.in
  
  ((count_geom++))
done

for i in ${th_params[@]}; do
  echo $i
done

echo "finished bash script"


