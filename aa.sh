#! /bin/bash
VERSION='v5.0.1'

URI="https://github.com/containers/podman/releases/download/${VERSION}"
for artifact in "podman-remote-release-darwin_amd64.zip darwin_amd" \
                'podman-remote-release-darwin_arm64.zip darwin_arm' \
                'podman-remote-release-windows_amd64.zip windows_amd' \
                'podman-remote-static-linux_amd64.tar.gz linux_amd' \
                'asdfasdfsadf lasdf' \
                'podman-remote-static-linux_arm64.tar.gz linux_arm'
do
  set -- $artifact
  status=$(curl -s -o /dev/null -w "%{http_code}" "${URI}/${1:?}")

  if [[ "$status" == "404" ]] ; then
    echo "${1:?} will be built"
    needsbuild=true
    echo "${2:?}=true"
  else
    echo "::warning::${1:?} already exists, skipping"
  fi
done

echo $needsbuild

# VERSION='v5.0.1'
# URI="https://github.com/containers/podman/releases/download/${VERSION}"


# for artifact in 'podman-remote-release-darwin_amd64.zip' \
#                 'podman-remote-release-darwin_arm64.zip' \
#                 'podman-remote-release-windows_amd64.zip' \
#                 'podman-remote-static-linux_amd64.tar.gz' \
#                 'podman-remote-static-linux_arm64.tar.gz' \
#                 'sadf'

#   do
#     status=$(curl -s -o /dev/null -w "%{http_code}" "${URI}/${artifact}")
#     if [[ "$status" == "404" ]] ; then
#       needsbuild=true
#       # echo "${artifact}=true" >> $GITHUB_OUTPUT
#     else
#       echo "::warning::${artifact} already exists, skipping"
#     fi
# done

# if [ "$needsbuild" = true ]; then
#   echo "we need to build something"
# else
#   echo "sadfsd"
# fi

        #  URI="https://github.com/containers/podman/releases/download/${{steps.getversion.outputs.version}}"
        #   for artifact in "podman-remote-release-darwin_amd64.zip darwin_amd" \
        #         'podman-remote-release-darwin_arm64.zip darwin_arm' \
        #         'podman-remote-release-windows_amd64.zip windows_amd' \
        #         'podman-remote-static-linux_amd64.tar.gz linux_amd' \
        #         'podman-remote-static-linux_arm64.tar.gz linux_arm'
        #   do
        #     set -- $artifact # Convert the "tuple" into the param args $1 $2...
        #     status=$(curl -s -o /dev/null -w "%{http_code}" "${URI}/${1:?}")
        #     if [[ "$status" == "404" ]] ; then
        #       needsbuild=true
        #       echo "${2:?}=true"  >> $GITHUB_OUTPUT
        #     else
        #       echo "::warning::${artifact} already exists, skipping"
        #     fi
        #   done