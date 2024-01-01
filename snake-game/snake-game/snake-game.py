import pygame
import random

pygame.init()

WIDTH, HEIGHT = 640, 480
FPS = 10
BLOCK_SIZE = 20

WHITE = (255, 255, 255)
RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLACK = (0, 0, 0)

screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Snake Game")

clock = pygame.time.Clock()

snake = [(WIDTH / 2, HEIGHT / 2)]
snake_direction = 'RIGHT'
snake_speed = 10

food = (random.randint(0, WIDTH // BLOCK_SIZE - 1) * BLOCK_SIZE,
        random.randint(0, HEIGHT // BLOCK_SIZE - 1) * BLOCK_SIZE)

score = 0
font = pygame.font.Font(None, 36)

running = True
while running:
    screen.fill(BLACK)

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_UP and snake_direction != 'DOWN':
                snake_direction = 'UP'
            elif event.key == pygame.K_DOWN and snake_direction != 'UP':
                snake_direction = 'DOWN'
            elif event.key == pygame.K_LEFT and snake_direction != 'RIGHT':
                snake_direction = 'LEFT'
            elif event.key == pygame.K_RIGHT and snake_direction != 'LEFT':
                snake_direction = 'RIGHT'

    x, y = snake[0]
    if snake_direction == 'UP':
        y -= BLOCK_SIZE
    elif snake_direction == 'DOWN':
        y += BLOCK_SIZE
    elif snake_direction == 'LEFT':
        x -= BLOCK_SIZE
    elif snake_direction == 'RIGHT':
        x += BLOCK_SIZE

    if x < 0 or x >= WIDTH or y < 0 or y >= HEIGHT:
        running = False

    if x == food[0] and y == food[1]:
        food = (random.randint(0, WIDTH // BLOCK_SIZE - 1) * BLOCK_SIZE,
                random.randint(0, HEIGHT // BLOCK_SIZE - 1) * BLOCK_SIZE)
        snake_speed += 1
        score += 1
    else:
        snake.pop()

    if (x, y) in snake:
        running = False

    snake.insert(0, (x, y))

    for s in snake:
        pygame.draw.rect(screen, GREEN, (s[0], s[1], BLOCK_SIZE, BLOCK_SIZE))
    pygame.draw.rect(screen, RED, (food[0], food[1], BLOCK_SIZE, BLOCK_SIZE))

    score_text = font.render(f"Score: {score}", True, WHITE)
    screen.blit(score_text, (10, 10))

    pygame.display.flip()
    clock.tick(snake_speed)

pygame.quit()
