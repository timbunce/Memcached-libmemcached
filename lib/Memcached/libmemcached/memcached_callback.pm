package Memcached::libmemcached::memcached_callback;

=head1 NAME

memcached_callback_get memcached_callback_set

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  memcached_return 
    memcached_callback_set (memcached_st *ptr, 
                            memcached_callback flag, 
                            void *data);

  void *
    memcached_callback_get (memcached_st *ptr, 
                            memcached_callback flag,
                            memcached_return *error);

=head1 DESCRIPTION

libmemcached(3) can have callbacks set key execution points. These either
provide function calls at points in the code, or return pointers to
structures for particular usages.

memcached_callback_get() takes a callback flag and returns the structure or
function set by memcached_callback_set().

memcached_callback_set() changes the function/structure assigned by a
callback flag. No connections are reset. 

=over 4

=item MEMCACHED_CALLBACK_CLEANUP_FUNCTION

When memcached_delete() is called this function will be excuted. At the
point of its execution all connections have been closed.

=item MEMCACHED_CALLBACK_CLONE_FUNCTION

When memcached_delete() is called this function will be excuted. At the
point of its execution all connections have been closed.

=item MEMCACHED_CALLBACK_USER_DATA

This allows you to store a pointer to a specifc piece of data. This can be
retrieved from inside of memcached_fetch_execute(). Cloning a memcached_st
will copy the pointer to the clone.

=item  MEMCACHED_CALLBACK_MALLOC_FUNCTION,

This alllows yout to pass in a customized version of malloc that will be used instead of the builtin malloc(3) call.
The prototype for this is:

void *(*memcached_malloc_function)(memcached_st *ptr, const size_t size);

You can use MEMCACHED_CALLBACK_USER_DATA to provide custom context if required for malloc.

=item  MEMCACHED_CALLBACK_REALLOC_FUNCTION,

This alllows yout to pass in a customized version of realloc that will be used instead of the builtin realloc(3) call.
The prototype for this is:

void *(*memcached_realloc_function)(memcached_st *ptr, void *mem, const size_t size);

You can use MEMCACHED_CALLBACK_USER_DATA to provide custom context if required for realloc.

=item  MEMCACHED_CALLBACK_FREE_FUNCTION,

This alllows yout to pass in a customized version of realloc that will be used instead of the builtin free(3) call.
The prototype for this is:

typedef void (*memcached_free_function)(memcached_st *ptr, void *mem);

You can use MEMCACHED_CALLBACK_USER_DATA to provide custom context if required for realloc.

=back

=head1 RETURN

memcached_callback_get() return the function or structure that was provided.
Upon error, nothing is set, null is returned, and the memcached_return
argument is set to MEMCACHED_FAILURE.

memcached_callback_set() returns MEMCACHED_SUCCESS upon successful setting,
otherwise MEMCACHED_FAILURE on error.

=head1 HOME

To find out more information please check:
L<http://tangent.org/552/libmemcached.html>

=head1 AUTHOR

Brian Aker, E<lt>brian@tangent.orgE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_strerror(3)

=cut

1;
