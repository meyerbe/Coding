#!bin/bash/


# Input path to data
#read -p "Path to DARWIN data:" path_darwin
#path_root=/Users/bettinameyer/polybox/ClimatePhysics/Copenhagen/Projects/LES_ColdPool/double_2D_nonoise/Out_CPDry_double_2D_dTh10K
#path_in=$path_root/fields_k120/
path_root=/Users/bettinameyer/polybox/ClimatePhysics/Copenhagen/Projects/LES_ColdPool/triple_3D_noise/Out_CPDry_triple_dTh3K
#path_in=$path_root/fields/
path_in=$path_root/test_dir/
path_out=$path_root/fields_renamed/

echo "renaming files in: $path_in"
mkdir -p $path_out  # only create directory if not existing
echo "output in: $path_out"


#find $path_in -name "*.nc"

#find $path_in -name "*.nc" | xargs basename

for entry in "$path_in"/*.nc
  do
  file_name=$(basename $entry)
  #echo $entry
  echo $file_name
  declare -i chrlen=${#file_name}
  echo $chrlen
  if [ $chrlen \< 6 ]
    then
    echo "below 100"
    new_name="10000"$file_name
    #echo $new_name
    #cp $path_in/$file_name $path_out/$new_name
  elif [ $chrlen \< 7 ]
    then
    echo "below 1000"
    new_name="1000"$file_name
  elif [ $chrlen \< 8 ]
    then 
    echo "below 10'000"
    new_name="100"$file_name
  fi
echo $new_name
cp $path_in/$file_name $path_out/$new_name

done
