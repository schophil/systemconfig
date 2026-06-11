mytask() {
	local year=`date "+%Y"`
	local day=`date "+%Y%m%d"`
	local folder="${day}_$1"
	mkdir -p "$year/$folder"
	touch "$year/$folder/readme.md"
}
