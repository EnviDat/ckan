# download core
git clone https://github.com/EnviDat/ckan.git

# set source orgin
ckan_source_dir=$PWD

echo $ckan_source_dir

# download all extensions
cd $ckan_source_dir
git clone https://github.com/EnviDat/ckanext-envidat_theme.git

cd $ckan_source_dir
git clone https://github.com/EnviDat/ckanext-passwordless.git

cd $ckan_source_dir
git clone https://github.com/EnviDat/ckanext-package_converter.git

cd $ckan_source_dir
git clone https://github.com/ckan/ckanext-scheming.git

cd $ckan_source_dir
git clone https://github.com/EnviDat/ckanext-restricted.git

cd $ckan_source_dir
git clone https://github.com/EnviDat/ckanext-repeating.git

cd $ckan_source_dir
git clone https://github.com/EnviDat/ckanext-composite.git

cd $ckan_source_dir
git clone https://github.com/EnviDat/ckanext-hierarchy.git

cd $ckan_source_dir
git clone https://github.com/EnviDat/ckanext-datacite_publication.git

cd $ckan_source_dir
git clone https://github.com/EnviDat/ckanext-spatial.git

cd $ckan_source_dir
git clone https://github.com/EnviDat/ckanext-oaipmh_repository.git

