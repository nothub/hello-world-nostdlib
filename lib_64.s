.intel_syntax noprefix
.text

.global _start
_start:
  xor rbp, rbp     /* set rbp 0 */
  pop rdi          /* argc */
  mov rsi, rsp     /* argv */
  call main
  mov rdi, rax     /* exit status code from main call */
  mov rax, 60      /* syscall exit is syscall id 60 */
  syscall

.global write
write:
  mov rax, 1       /* rax holds the syscalls id, syscall write is syscall id 1 */
  jmp _syscall

_syscall:
  mov r10, rcx     /* rdi, rsi, rdx, r8, r9, r10 are syscall parameters, all except rcx are already set properly by the previous function call */
  syscall
  ret
