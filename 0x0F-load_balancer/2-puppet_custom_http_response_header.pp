# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define custom HTTP header
file { '/etc/nginx/sites-available/custom-header':
  ensure  => present,
  content => "server {
                listen 80 default_server;
                root /var/www/html;
                index index.html;
                location / {
                    add_header X-Served-By $hostname;
                    try_files \$uri \$uri/ =404;
                }
            }",
}

# Create a symlink to enable the custom header configuration
file { '/etc/nginx/sites-enabled/custom-header':
  ensure => link,
  target => '/etc/nginx/sites-available/custom-header',
  require => File['/etc/nginx/sites-available/custom-header'],
}

# Ensure Nginx service is running
service { 'nginx':
  ensure => running,
  enable => true,
}
