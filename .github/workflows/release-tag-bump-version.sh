prevVer=$(node -p "require('./package.json').version")
echo "Current version: $prevVer"

msgs=$(git log --oneline $(git describe --tags --abbrev=0)..HEAD)

#echo ${msgs,,}

if [[ ${msgs,,} =~ (fix:|refactoring:) ]]; then
    echo "--> Bump patch version to "
    npm --no-git-tag-version version patch
#else
#    echo "no 'fix:' or 'refactoring:' commit message found.."
fi

if [[ ${msgs,,} =~ feat: ]]; then
    echo "--> Bump minor version to "
    npm --no-git-tag-version version minor
#else
#    echo "no 'feat:' commit meassage found.."
fi

if [[ ${msgs,,} =~ (breaking change:|!:) ]]; then
    echo "--> Bump major version to "
    npm --no-git-tag-version version major
#else
#    echo "no 'BREAKING CHANGE' or '!' found.."
fi

newVer=$(node -p "require('./package.json').version")

if [[ "$prevVer" == "$newVer" ]]; then
    message="Unable to find actual version changes. Did you use proper conventional commit messages? Available types/scopes: 'fix:', 'refactoring:', 'feat:', 'breaking changes:' or '<type/scope>!:'"
    echo "::error file={name},line={line},endLine={endLine},title={title}::${message}"
    exit 1
fi
