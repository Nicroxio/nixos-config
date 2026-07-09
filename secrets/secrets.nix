let
  nic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKKP7b2vq6iMqmMQkxB8qyBjEIdzRckSvo7elnO47BuS nic@macbook";
  users = [ nic ];

  macbook = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKKP7b2vq6iMqmMQkxB8qyBjEIdzRckSvo7elnO47BuS nic@macbook";
  systems = [ macbook ];
in
{
  "hermes.age".publicKeys = [
    nic
    macbook
  ];
}
