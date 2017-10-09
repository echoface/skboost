#include "linux_net.h"

int main(int argc, char** argv) {
  int socketfd, n;
  char recvline[MAXLEN + 1];
  struct sockaddr_in servaddr;
  if (argc != 2) {
    err_quit("argument error, usage: a.out <ipaddress>");
  }

  if ( (socketfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    err_quit("open socket error");

  bzero(&servaddr, sizeof(servaddr));
  servaddr.sin_family = AF_INET;
  servaddr.sin_port = htons(13);
  if (inet_pton(AF_INET, argv[1], &servaddr.sin_addr) <= 0) {
    err_quit("inet_pton error");
  }

  if (connet(socketfd, (SA*)&servaddr, sizeof(servaddr)) < 0)
    err_quit("Connet to server error");


  while( (n = read(socket, recvline, MAXLEN)) > 0) {
    recvline[n] = 0;
    if ()
  }
}
