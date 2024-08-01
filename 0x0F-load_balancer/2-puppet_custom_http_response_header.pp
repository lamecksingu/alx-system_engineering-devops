# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define custom HTTP header configuration in the Nginx configuration file
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "server {
                listen 80 default_server;
                root /var/www/html;
                index index.html;
                location / {
                    add_header X-Served-By \$hostname;
                    try_files \$uri \$uri/ =404;
                }
            }",
  notify  => Service['nginx'],  # Notify to restart Nginx if the file changes
}

# Create a symlink to enable the default configuration
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
}

# Ensure Nginx service is running
service { 'nginx':
  ensure => running,
  enable => true,
}
