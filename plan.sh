pkg_name=VotingApp-DB-Plan
pkg_origin=kbhimanavarjula
pkg_version="0.1.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('Apache-2.0')
pkg_source="https://github.com/kbhimanavarjula/VotingApp"
pkg_shasum=""
pkg_deps=(core/postgresql)
pkg_source="https://github.com/kbhimanavarjula/VotingApp"
$pkg_bin_dirs=@("bin")
$pkg_lib_dirs=@("lib")
$pkg_include_dirs=@("include")
$pkg_exports=@{
    "port"="5432"
    "password"="Password@1234"
    "username"="adminuser"
}
pkg_build_deps=(core/git core/maven core/dotnet-core-sdk)


do_build()
{
        # This installs both npm as well as the nconf module we listed as a dependency in package.json.
        apt-get install postgresql
}


do_download()
{
        build_line "do_download() =================================================="
        cd ${HAB_CACHE_SRC_PATH}
        build_line "\$pkg_dirname=${pkg_dirname}"
        build_line "\$pkg_filename=${pkg_filename}"
        if [ -d "${pkg_dirname}" ];
        then
            rm -rf ${pkg_dirname}
        fi
        mkdir ${pkg_dirname}
        cd ${pkg_dirname}
        GIT_SSL_NO_VERIFY=true git clone --branch master https://github.com/nvtuluva/VotingApp.git
        return 0
}
do_clean()
{
        build_line "do_clean() ===================================================="
        return 0
}

do_unpack()
{
        # Nothing to unpack as we are pulling our code straight from github
        return 0
}
do_install()
{
        return 0
}