function rstudio-upd --argument version -d "Update AUR pkg rstudio-desktop-preview"

    cd ~/git/pkgbuilds/rstudio-desktop-preview-bin
    sed -i "s/.*pkgver=.*/pkgver=$argv/" PKGBUILD 
    updpkgsums
    git stage PKGBUILD
    cd ..
    bash pre-commit.hook
    # git stage .SRCINFO
    git commit -m "v$argv"
    bash aurpublish rstudio-desktop-preview-bin
    git push

end
