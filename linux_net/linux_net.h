#ifndef LINUX_NET_H_H
#define LINUX_NET_H_H

#include <errno.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>

#define MAXLEN = 1000;

void err_quit(const char* msg) {
  printf("ERROR: %s", msg);
  exit(-1);
}

#endif
