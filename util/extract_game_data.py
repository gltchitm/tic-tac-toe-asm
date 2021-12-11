#!/usr/bin/env python3

def calculate_masks(*bases):
    masks = []
    for base in bases:
        masks.append({
            'empty': base,
            'x': base * 2,
            'o': base * 4
        })
    return masks

masks = calculate_masks(1, 8, 64, 512, 4096, 32768, 262144, 2097152, 16777216)

PLAYER_X_TURN = 134217728
PLAYER_O_TURN = 1073741824

if __name__ == '__main__':
    r10 = int(input('Enter the game data bitmask: '))

    for i in range(9):
        if r10 & masks[i]['empty']:
            print(f'Spot {i} is: Empty')
        elif r10 & masks[i]['x']:
            print(f'Spot {i} is: X')
        elif r10 & masks[i]['o']:
            print(f'Spot {i} is: O')
        else:
            print(f'Could not extract data for spot {i}!')

    if r10 & PLAYER_X_TURN:
        print('Turn: X')
    elif r10 & PLAYER_O_TURN:
        print('Turn: O')
    else:
        print('Could not extract turn!')
