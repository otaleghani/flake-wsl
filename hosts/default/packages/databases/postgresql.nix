{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    postgresql
    pgcli
    psqlodbc
    postgis
    pgtop
    pgbackrest
  ];
}
