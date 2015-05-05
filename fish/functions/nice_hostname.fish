# nice_hostname
#
# Take the first part of the hostname.
function nice_hostname
  hostname | cut -d . -f 1
end

